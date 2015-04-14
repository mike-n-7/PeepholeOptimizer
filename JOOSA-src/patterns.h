/*
 * JOOS is Copyright (C) 1997 Laurie Hendren & Michael I. Schwartzbach
 *
 * Reproduction of all or part of this software is permitted for
 * educational or research use on condition that this copyright notice is
 * included in any copy. This software comes with no warranty of any
 * kind. In no event will the authors be liable for any damages resulting from
 * use of this software.
 *
 * email: hendren@cs.mcgill.ca, mis@brics.dk
 */

/* iload x        iload x        iload x
 * ldc 0          ldc 1          ldc 2
 * imul           imul           imul
 * ------>        ------>        ------>
 * ldc 0          iload x        iload x
 *                               dup
 *                               iadd
 */

int simplify_multiplication_right(CODE **c)
{ int x,k;
  if (is_iload(*c,&x) && 
      is_ldc_int(next(*c),&k) && 
      is_imul(next(next(*c)))) {
     if (k==0) return replace(c,3,makeCODEldc_int(0,NULL));
     else if (k==1) return replace(c,3,makeCODEiload(x,NULL));
     else if (k==2) return replace(c,3,makeCODEiload(x,
                                       makeCODEdup(
                                       makeCODEiadd(NULL))));
     return 0;
  }
  return 0;
}

/* dup        [ x * ] -> [ x x ]
 * astore x   [ x x ] -> [ x * ]
 * pop        [ x * ] -> [ * * ]
 * -------->
 * astore x   [ x * ] -> [ * * ]
 * 
 * Sound because we duplicate a value that we would have gotten rid of anyways.
 */
int simplify_astore(CODE **c)
{ int x;
  if (is_dup(*c) &&
      is_astore(next(*c),&x) &&
      is_pop(next(next(*c)))) {
     return replace(c,3,makeCODEastore(x,NULL));
  }
  return 0;
}

/* dup
 * istore x
 * pop
 * -------->
 * istore x
 *
 * Sound because we duplicate a value that we would have gotten rid of anyways. Same as previous rule.
 */
int simplify_istore(CODE **c)
{ int x;
  if (is_dup(*c) &&
      is_istore(next(*c),&x) &&
      is_pop(next(next(*c)))) {
     return replace(c,3,makeCODEistore(x,NULL));
  }
  return 0;
}

/* iload x
 * ldc k   (0<=k<=127)
 * iadd
 * istore x
 * --------->
 * iinc x k
 */ 
int positive_increment(CODE **c)
{ int x,y,k;
  if (is_iload(*c,&x) &&
      is_ldc_int(next(*c),&k) &&
      is_iadd(next(next(*c))) &&
      is_istore(next(next(next(*c))),&y) &&
      x==y && 0<=k && k<=127) {
     return replace(c,4,makeCODEiinc(x,k,NULL));
  }
  return 0;
}

/* goto L1
 * ...
 * L1:
 * goto L2
 * ...
 * L2:
 * --------->
 * goto L2
 * ...
 * L1:    (reference count reduced by 1)
 * goto L2
 * ...
 * L2:    (reference count increased by 1)  
 */
int simplify_goto_goto(CODE **c)
{ int l1,l2;
  if (is_goto(*c,&l1) && is_goto(next(destination(l1)),&l2) && l1>l2) {
     droplabel(l1);
     copylabel(l2);
     return replace(c,1,makeCODEgoto(l2,NULL));
  }
  return 0;
}

/*
goto label1
...
label1:
label2:

---->
goto label2:
...
label1:
label2:

Sound because no code is executed between label1 and label2 so we can jump directly to label2.
*/
int goto_double_label(CODE **c) {
  int l1, l2;
  if (is_goto(*c, &l1) && is_label(next(destination(l1)), &l2)) {
    droplabel(l1);
    copylabel(l2);
    return replace(c, 1, makeCODEgoto(l2, NULL));
  }
  return 0;
}

/*
Sound because if nothing is referencing a label, we might as well remove it.
*/
int remove_dead_label(CODE **c) {
  int l1;
  if (is_label(*c, &l1) && deadlabel(l1)) {
    return kill_line(c);
  }
  return 0;
}

/* ifnull label1
   goto label2
   label1:
   ---->
   ifnonnull label2
   label1:

   Sound because no code is in the else part of the conditional. Therefore we can negate it and
   go directly to the if part. We keep the label because it may be referenced somewhere else and
   don't want to remove it in this case.
*/
int simplify_ifnull(CODE **c) {
  int x, y, z;
  if (is_ifnull(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEifnonnull(y, NULL));
  }
  return 0;
}

/* ifnonnull label1
   goto label2
   label1:
   ---->
   ifnull label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_ifnonnull(CODE **c) {
  int x, y, z;
  if (is_ifnonnull(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEifnull(y, NULL));
  }
  return 0;
}

/* ifeq label1
   goto label2
   label1:
   ...
   label2:
   ---->
   ifne label2
   label1:
   ...
   label2:

   Sound for the same reason as simplify_ifnull.
*/
int simplify_ifeq(CODE **c) {
  int x, y, z;
  if (is_ifeq(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEifne(y, NULL));
  }
  return 0;
}

/* ifne label1
   goto label2
   label1:
   ---->
   ifeq label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_ifne(CODE **c) {
  int x, y, z;
  if (is_ifne(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEifeq(y, NULL));
  }
  return 0;
}

/* if_acmpeq label1
   goto label2
   label1:
   ---->
   if_acmpne label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_acmpeq(CODE **c) {
  int x, y, z;
  if (is_if_acmpeq(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_acmpne(y, NULL));
  }
  return 0;
}

/* if_acmpne label1
   goto label2
   label1:
   ---->
   if_acmpeq label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_acmpne(CODE **c) {
  int x, y, z;
  if (is_if_acmpne(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_acmpeq(y, NULL));
  }
  return 0;
}

/* if_icmpeq label1
   goto label2
   label1:
   ---->
   if_icmpne label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmpeq(CODE **c) {
  int x, y, z;
  if (is_if_icmpeq(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmpne(y, NULL));
  }
  return 0;
}

/* if_icmpne label1
   goto label2
   label1:
   ---->
   if_icmpeq label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmpne(CODE **c) {
  int x, y, z;
  if (is_if_icmpne(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmpeq(y, NULL));
  }
  return 0;
}

/* if_icmpgt label1
   goto label2
   label1:
   ---->
   if_icmple label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmpgt(CODE **c) {
  int x, y, z;
  if (is_if_icmpgt(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmple(y, NULL));
  }
  return 0;
}

/* if_icmple label1
   goto label2
   label1:
   ---->
   if_icmpgt label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmple(CODE **c) {
  int x, y, z;
  if (is_if_icmple(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmpgt(y, NULL));
  }
  return 0;
}

/* if_icmplt label1
   goto label2
   label1:
   ---->
   if_icmpge label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmplt(CODE **c) {
  int x, y, z;
  if (is_if_icmplt(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmpge(y, NULL));
  }
  return 0;
}

/* if_icmpge label1
   goto label2
   label1:
   ---->
   if_icmplt label2

   Sound for the same reason as simplify_ifnull.
*/
int simplify_if_icmpge(CODE **c) {
  int x, y, z;
  if (is_if_icmpge(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    droplabel(x);
    return replace(c, 2, makeCODEif_icmplt(y, NULL));
  }
  return 0;
}

/*
if_icmpge label1 
iconst_0
goto label2 
label1:
iconst_1
label2:
ifeq label3 
------->
label1:
label2:
if_icmplt label3

Sound because the inner code is only used to make a conditional based on the result of the first conditional.
We need to make sure label1 and label2 are unique so we can't get inside this code section from elsewhere
in the bytecode.
*/
int simplify_doubleif_icmpge(CODE **c) {
  int x1, c1, x2, l1, c2, l2, x3;
  if (is_if_icmpge(*c, &x1) &&
      is_ldc_int(next(*c), &c1) && c1 == 0 &&
      is_goto(next(next(*c)), &x2) &&
      is_label(next(next(next(*c))), &l1) && l1 == x1 &&
      is_ldc_int(next(next(next(next(*c)))), &c2) && c2 == 1 &&
      is_label(next(next(next(next(next(*c))))), &l2) && l2 == x2 &&
      is_ifeq(next(next(next(next(next(next(*c)))))), &x3) && uniquelabel(l2) && uniquelabel(l1))  {
    droplabel(l1);
    droplabel(l2);
    return replace(c, 7, makeCODEif_icmplt(x3, makeCODElabel(l1, makeCODElabel(l2, NULL))));
  }
  return 0;
}
/*
if_icmpgt label1
iconst_0
goto label2
label1:
iconst_1
label2:
ifeq label3
------->
label1:
label2:
if_icmple label3

Sound for same reason as simplify_doubleif_icmpge.
*/
int simplify_doubleif_icmpgt(CODE **c) {
  int x1, c1, x2, l1, c2, l2, x3;
  if (is_if_icmpgt(*c, &x1) &&
      is_ldc_int(next(*c), &c1) && c1 == 0 &&
      is_goto(next(next(*c)), &x2) &&
      is_label(next(next(next(*c))), &l1) && l1 == x1 &&
      is_ldc_int(next(next(next(next(*c)))), &c2) && c2 == 1 &&
      is_label(next(next(next(next(next(*c))))), &l2) && l2 == x2 &&
      is_ifeq(next(next(next(next(next(next(*c)))))), &x3) && uniquelabel(l2) && uniquelabel(l1))  {
    droplabel(l1);
    droplabel(l2);
    return replace(c, 7, makeCODEif_icmple(x3, makeCODElabel(l1, makeCODElabel(l2, NULL))));
  }
  return 0;
}
/*
if_icmple label1
iconst_0
goto label2
label1:
iconst_1
label2:
ifeq label3
------->
label1:
label2:
if_icmpgt label3

Sound for same reason as simplify_doubleif_icmpge.
*/
int simplify_doubleif_icmple(CODE **c) {
  int x1, c1, x2, l1, c2, l2, x3;
  if (is_if_icmple(*c, &x1) &&
      is_ldc_int(next(*c), &c1) && c1 == 0 &&
      is_goto(next(next(*c)), &x2) &&
      is_label(next(next(next(*c))), &l1) && l1 == x1 &&
      is_ldc_int(next(next(next(next(*c)))), &c2) && c2 == 1 &&
      is_label(next(next(next(next(next(*c))))), &l2) && l2 == x2 &&
      is_ifeq(next(next(next(next(next(next(*c)))))), &x3) && uniquelabel(l2) && uniquelabel(l1))  {
    droplabel(l1);
    droplabel(l2);
    return replace(c, 7, makeCODEif_icmpgt(x3, makeCODElabel(l1, makeCODElabel(l2, NULL))));
  }
  return 0;
}
/*
if_icmplt label1
iconst_0
goto label2
label1:
iconst_1
label2:
ifeq label3
------->
label1:
label2:
if_icmpge label3

Sound for same reason as simplify_doubleif_icmpge.
*/
int simplify_doubleif_icmplt(CODE **c) {
  int x1, c1, x2, l1, c2, l2, x3;
  if (is_if_icmplt(*c, &x1) &&
      is_ldc_int(next(*c), &c1) && c1 == 0 &&
      is_goto(next(next(*c)), &x2) &&
      is_label(next(next(next(*c))), &l1) && l1 == x1 &&
      is_ldc_int(next(next(next(next(*c)))), &c2) && c2 == 1 &&
      is_label(next(next(next(next(next(*c))))), &l2) && l2 == x2 &&
      is_ifeq(next(next(next(next(next(next(*c)))))), &x3) && uniquelabel(l2) && uniquelabel(l1))  {
    droplabel(l1);
    droplabel(l2);
    return replace(c, 7, makeCODEif_icmpge(x3, makeCODElabel(l1, makeCODElabel(l2, NULL))));
  }
  return 0;
}
#define OPTS 23
OPTI optimization[OPTS] = {simplify_multiplication_right,
                           simplify_astore,
                           positive_increment,
                           simplify_goto_goto,
                           goto_double_label,
                           simplify_istore,
                           simplify_ifnull,
                           simplify_ifnonnull,
                           simplify_ifeq,
                           simplify_ifne,
                           simplify_if_acmpne,
                           simplify_if_acmpeq,
                           simplify_if_icmpge,
                           simplify_if_icmplt,
                           simplify_if_icmple,
                           simplify_if_icmpgt,
                           simplify_if_icmpne,
                           simplify_if_icmpeq,
                           simplify_doubleif_icmpge,
                           remove_dead_label,
                           simplify_doubleif_icmple,
                           simplify_doubleif_icmpgt,
                           simplify_doubleif_icmplt
                          };
