.class public GrueHunt

.super java/lang/Object

.method public <init>()V
  .limit locals 1
  .limit stack 1
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  return
.end method

.method public testLoop(Ljoos/lib/JoosIO;Z)Ljava/lang/String;
  .limit locals 4
  .limit stack 1
  aconst_null
  astore_3
  iload_2
  ifeq true_1
  iconst_0
  goto stop_2
  true_1:
  iconst_1
  stop_2:
  ifeq stop_0
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore_3
  stop_0:
  aload_3
  areturn
  nop
.end method

.method public static main([Ljava/lang/String;)V
  .limit locals 16
  .limit stack 5
  new GrueHunt
  dup
  invokenonvirtual GrueHunt/<init>()V
  astore 14
  iconst_0
  istore 8
  ldc "╔═╝┏━┓╻ ╻┏━╸ ║ ║╻ ╻┏┓╻╺┳╸\n║ ║┣┳┛┃ ┃┣╸  ╔═║┃ ┃┃┗┫ ┃ \n══╝╹┗╸┗━┛┗━╸ ╝ ╝┗━┛╹ ╹ ╹ "
  astore 11
  ldc 20
  istore 13
  ldc 100
  istore 7
  new joos/lib/JoosIO
  dup
  invokenonvirtual joos/lib/JoosIO/<init>()V
  astore_1
  ldc 11
  istore 6
  new Room
  dup
  aconst_null
  ldc "null"
  iload 6
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  astore 12
  iconst_0
  istore_2
  iconst_0
  istore_3
  ldc 10
  istore 4
  aload_1
  ldc "\n"
  dup
  ifnonnull stop_1
  pop
  ldc "null"
  stop_1:
  aload 11
  dup
  ifnonnull stop_3
  pop
  ldc "null"
  stop_3:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "\n"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "Welcome to GrueHunt! Please don't feed the grues."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "What is your name?"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  invokevirtual joos/lib/JoosIO/readLine()Ljava/lang/String;
  astore 9
  aload 9
  aconst_null
  if_acmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  dup
  ifne true_5
  pop
  aload 9
  ldc ""
  invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
  true_5:
  ifeq stop_4
  ldc "Dave"
  astore 9
  stop_4:
  aload 12
  invokevirtual Room/enterRoom()V
  start_8:
  aload 14
  aload_1
  iload 8
  invokevirtual GrueHunt/testLoop(Ljoos/lib/JoosIO;Z)Ljava/lang/String;
  dup
  astore 10
  aconst_null
  if_acmpne true_10
  iconst_0
  goto stop_11
  true_10:
  iconst_1
  stop_11:
  ifeq stop_9
  aload_1
  ldc ""
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload 10
  ldc "give up"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_12
  aload_1
  ldc "You have given up, "
  dup
  ifnonnull stop_19
  pop
  ldc "null"
  stop_19:
  aload 9
  dup
  ifnonnull stop_21
  pop
  ldc "null"
  stop_21:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_17
  pop
  ldc "null"
  stop_17:
  ldc "."
  dup
  ifnonnull stop_23
  pop
  ldc "null"
  stop_23:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "You spend the rest of your days wandering this bizarre world. Better luck next time!"
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iconst_1
  istore 8
  goto stop_13
  else_12:
  aload 10
  ldc "north"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_24
  aload 12
  invokevirtual Room/getNorth()LRoom;
  astore 15
  aload 15
  aconst_null
  if_acmpeq true_30
  iconst_0
  goto stop_31
  true_30:
  iconst_1
  stop_31:
  ifeq else_28
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_28:
  aload 15
  astore 12
  aload_1
  ldc "You go north."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_24:
  aload 10
  ldc "south"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_32
  aload 12
  invokevirtual Room/getSouth()LRoom;
  astore 15
  aload 15
  aconst_null
  if_acmpeq true_38
  iconst_0
  goto stop_39
  true_38:
  iconst_1
  stop_39:
  ifeq else_36
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_36:
  aload 15
  astore 12
  aload_1
  ldc "You go south."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_32:
  aload 10
  ldc "west"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_40
  aload 12
  invokevirtual Room/getWest()LRoom;
  astore 15
  aload 15
  aconst_null
  if_acmpeq true_46
  iconst_0
  goto stop_47
  true_46:
  iconst_1
  stop_47:
  ifeq else_44
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_44:
  aload 15
  astore 12
  aload_1
  ldc "You go west."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_40:
  aload 10
  ldc "east"
  iconst_0
  invokevirtual java/lang/String/indexOf(Ljava/lang/String;I)I
  iconst_0
  if_icmplt else_48
  aload 12
  invokevirtual Room/getEast()LRoom;
  astore 15
  aload 15
  aconst_null
  if_acmpeq true_54
  iconst_0
  goto stop_55
  true_54:
  iconst_1
  stop_55:
  ifeq else_52
  aload_1
  ldc "There is no exit that way."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_52:
  aload 15
  astore 12
  aload_1
  ldc "You go east."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_13
  else_48:
  aload 12
  invokevirtual Room/getRoomAction()LRoomAction;
  aload 10
  invokevirtual RoomAction/performAction(Ljava/lang/String;)I
  istore 5
  iload 5
  iconst_0
  if_icmpeq true_58
  iconst_0
  goto stop_59
  true_58:
  iconst_1
  stop_59:
  ifne stop_57
  iload 5
  iconst_1
  if_icmpeq true_62
  iconst_0
  goto stop_63
  true_62:
  iconst_1
  stop_63:
  ifeq else_60
  iconst_0
  istore 4
  goto stop_57
  else_60:
  iload 5
  iconst_2
  if_icmpeq true_66
  iconst_0
  goto stop_67
  true_66:
  iconst_1
  stop_67:
  ifeq else_64
  aload_1
  aload 9
  dup
  ifnonnull stop_69
  pop
  ldc "null"
  stop_69:
  ldc ".\n"
  dup
  ifnonnull stop_71
  pop
  ldc "null"
  stop_71:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/print(Ljava/lang/String;)V
  goto stop_57
  else_64:
  iload 5
  iconst_3
  if_icmpeq true_74
  iconst_0
  goto stop_75
  true_74:
  iconst_1
  stop_75:
  ifeq else_72
  iinc 3 1
  aload_1
  ldc "You have "
  dup
  ifnonnull stop_79
  pop
  ldc "null"
  stop_79:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_77
  pop
  ldc "null"
  stop_77:
  ldc " treasure(s)."
  dup
  ifnonnull stop_83
  pop
  ldc "null"
  stop_83:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_72:
  iload 5
  iconst_4
  if_icmpeq true_86
  iconst_0
  goto stop_87
  true_86:
  iconst_1
  stop_87:
  ifeq else_84
  aload_1
  ldc "You have "
  dup
  ifnonnull stop_91
  pop
  ldc "null"
  stop_91:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_89
  pop
  ldc "null"
  stop_89:
  ldc " treasure(s)."
  dup
  ifnonnull stop_95
  pop
  ldc "null"
  stop_95:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_84:
  iload 5
  iconst_5
  if_icmpeq true_98
  iconst_0
  goto stop_99
  true_98:
  iconst_1
  stop_99:
  ifeq else_96
  iinc 2 1
  aload_1
  ldc "You have "
  dup
  ifnonnull stop_103
  pop
  ldc "null"
  stop_103:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_101
  pop
  ldc "null"
  stop_101:
  ldc " coin(s)."
  dup
  ifnonnull stop_107
  pop
  ldc "null"
  stop_107:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_96:
  iload 5
  ldc 6
  if_icmpeq true_110
  iconst_0
  goto stop_111
  true_110:
  iconst_1
  stop_111:
  ifeq else_108
  aload_1
  ldc "You have "
  dup
  ifnonnull stop_115
  pop
  ldc "null"
  stop_115:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_113
  pop
  ldc "null"
  stop_113:
  ldc " coin(s)."
  dup
  ifnonnull stop_119
  pop
  ldc "null"
  stop_119:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_108:
  iload 5
  ldc 7
  if_icmpeq true_122
  iconst_0
  goto stop_123
  true_122:
  iconst_1
  stop_123:
  ifeq else_120
  iinc 4 1
  goto stop_57
  else_120:
  iload 5
  ldc 8
  if_icmpeq true_126
  iconst_0
  goto stop_127
  true_126:
  iconst_1
  stop_127:
  ifeq else_124
  iinc 4 2
  goto stop_57
  else_124:
  iload 5
  ldc 9
  if_icmpeq true_130
  iconst_0
  goto stop_131
  true_130:
  iconst_1
  stop_131:
  ifeq else_128
  iload 4
  iconst_1
  isub
  istore 4
  goto stop_57
  else_128:
  iload 5
  ldc 10
  if_icmpeq true_134
  iconst_0
  goto stop_135
  true_134:
  iconst_1
  stop_135:
  ifeq else_132
  iload 4
  iconst_2
  isub
  istore 4
  goto stop_57
  else_132:
  iload 5
  ldc 11
  if_icmpeq true_138
  iconst_0
  goto stop_139
  true_138:
  iconst_1
  stop_139:
  ifeq else_136
  aload_1
  ldc "You have "
  dup
  ifnonnull stop_143
  pop
  ldc "null"
  stop_143:
  new java/lang/Integer
  dup
  iload 4
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_141
  pop
  ldc "null"
  stop_141:
  ldc " hit points remaining."
  dup
  ifnonnull stop_147
  pop
  ldc "null"
  stop_147:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_136:
  iload 5
  ldc 12
  if_icmpeq true_149
  iconst_0
  goto stop_150
  true_149:
  iconst_1
  stop_150:
  ifeq stop_148
  aload 12
  ldc 100
  invokevirtual Room/randomRange(I)I
  istore 7
  iload 7
  iload 13
  if_icmpge else_151
  aload_1
  ldc "You've escaped this bizarre world! You are now free."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  goto stop_57
  else_151:
  iload 6
  iconst_1
  isub
  istore 6
  iload 6
  iconst_5
  if_icmpeq true_156
  iconst_0
  goto stop_157
  true_156:
  iconst_1
  stop_157:
  ifeq stop_155
  ldc 11
  istore 6
  stop_155:
  new Room
  dup
  aconst_null
  ldc "null"
  iload 6
  invokenonvirtual Room/<init>(LRoom;Ljava/lang/String;I)V
  astore 12
  aload_1
  ldc "You suddenly notice the new place you find yourself."
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  stop_148:
  stop_57:
  iload 4
  ldc 15
  if_icmple stop_158
  ldc 15
  istore 4
  stop_158:
  iload 4
  iconst_1
  if_icmpge stop_161
  aload_1
  ldc "\n\n"
  dup
  ifnonnull stop_167
  pop
  ldc "null"
  stop_167:
  aload 9
  dup
  ifnonnull stop_169
  pop
  ldc "null"
  stop_169:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_165
  pop
  ldc "null"
  stop_165:
  ldc " died."
  dup
  ifnonnull stop_171
  pop
  ldc "null"
  stop_171:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  iconst_0
  istore 4
  iconst_1
  istore 8
  stop_161:
  iload 7
  iload 13
  if_icmpge stop_172
  iconst_1
  istore 8
  stop_172:
  stop_13:
  iload 8
  ifeq true_176
  iconst_0
  goto stop_177
  true_176:
  iconst_1
  stop_177:
  ifeq stop_175
  aload_1
  ldc ""
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload 12
  invokevirtual Room/enterRoom()V
  stop_175:
  goto start_8
  stop_9:
  aload_1
  aload 9
  dup
  ifnonnull stop_187
  pop
  ldc "null"
  stop_187:
  ldc " has accumulated "
  dup
  ifnonnull stop_189
  pop
  ldc "null"
  stop_189:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_185
  pop
  ldc "null"
  stop_185:
  new java/lang/Integer
  dup
  iload_3
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_183
  pop
  ldc "null"
  stop_183:
  ldc " treasure(s) and "
  dup
  ifnonnull stop_193
  pop
  ldc "null"
  stop_193:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_181
  pop
  ldc "null"
  stop_181:
  new java/lang/Integer
  dup
  iload_2
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_179
  pop
  ldc "null"
  stop_179:
  ldc " coin(s)."
  dup
  ifnonnull stop_197
  pop
  ldc "null"
  stop_197:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  aload 9
  dup
  ifnonnull stop_203
  pop
  ldc "null"
  stop_203:
  ldc " has "
  dup
  ifnonnull stop_205
  pop
  ldc "null"
  stop_205:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_201
  pop
  ldc "null"
  stop_201:
  new java/lang/Integer
  dup
  iload 4
  invokenonvirtual java/lang/Integer/<init>(I)V
  invokevirtual java/lang/Integer/toString()Ljava/lang/String;
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_199
  pop
  ldc "null"
  stop_199:
  ldc " hit points remaining."
  dup
  ifnonnull stop_209
  pop
  ldc "null"
  stop_209:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  aload_1
  ldc "Thank you for playing\n"
  dup
  ifnonnull stop_211
  pop
  ldc "null"
  stop_211:
  aload 11
  dup
  ifnonnull stop_213
  pop
  ldc "null"
  stop_213:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  invokevirtual joos/lib/JoosIO/println(Ljava/lang/String;)V
  return
.end method

