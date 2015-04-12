.class public StringEscapeUtils

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public escape(Ljava/lang/String;)Ljava/lang/String;
  .limit locals 3
  .limit stack 4
  aload_0
  aload_1
  ldc "::"
  ldc ":"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":)"
  ldc "\n"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":o"
  ldc "\0007"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  astore_2
  aload_0
  aload_2
  ldc ":>"
  ldc "\t"
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  areturn
  nop
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .limit locals 8
  .limit stack 5
  aload_1
  aload_2
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmpge true_1
  iconst_0
  goto stop_2
  true_1:
  iconst_1
  stop_2:
  ifeq stop_0
  aload_1
  iconst_0
  iload 5
  invokevirtual java/lang/String/substring(II)Ljava/lang/String;
  astore 6
  aload_1
  iload 5
  aload_2
  invokevirtual java/lang/String/length()I
  iadd
  aload_1
  invokevirtual java/lang/String/length()I
  invokevirtual java/lang/String/substring(II)Ljava/lang/String;
  astore 7
  aload 6
  dup
  ifnonnull stop_6
  pop
  ldc "null"
  stop_6:
  aload_3
  dup
  ifnonnull stop_8
  pop
  ldc "null"
  stop_8:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_4
  pop
  ldc "null"
  stop_4:
  aload_0
  aload 7
  aload_2
  aload_3
  invokevirtual StringEscapeUtils/replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_10
  pop
  ldc "null"
  stop_10:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  stop_0:
  aload_1
  areturn
  nop
.end method

