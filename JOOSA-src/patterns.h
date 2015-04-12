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

/* dup
 * astore x
 * pop
 * -------->
 * astore x
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
label2:
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

int remove_dead_label(CODE **c) {
  int l1;
  if (is_label(*c, &l1) && deadlabel(l1)) {
    return kill_line(c);
  }
  return 0;
}

/*
 istore 1
 iload 1
 ---->

*/
int remove_istore_iload(CODE **c) {
  int x, y;
  if (is_istore(*c,&x) &&
      is_iload(next(*c), &y) &&
      x == y) {
      return replace(c, 2, NULL);
  }
  return 0;
}

/*
 astore 1
 aload 1
 ---->

*/
int remove_astore_aload(CODE **c) {
  int x, y;
  if (is_astore(*c,&x) &&
      is_aload(next(*c), &y) &&
      x == y) {
      return replace(c, 2, NULL);
  }
  return 0;
}

/* ifnull label1
   goto label2
   label1:
   ---->
   ifnonnull label2
*/
int simplify_ifnull(CODE **c) {
  int x, y, z;
  if (is_ifnull(*c, &x) &&
      is_goto(next(*c), &y) &&
      is_label(next(next(*c)), &z) &&
      x == z) {
    return replace(c, 3, makeCODEifnonnull(y, NULL));
  }
  return 0;
}

/* iconst 0
   iload
   if_icmple label
   ----->
   iload
   ifg label
*/

#define OPTS 10

OPTI optimization[OPTS] = {simplify_multiplication_right,
                           simplify_astore,
                           positive_increment,
                           simplify_goto_goto,
                           goto_double_label,
                           remove_dead_label,
                           simplify_istore,
                           remove_astore_aload,
                           remove_istore_iload,
                           simplify_ifnull
                          };
