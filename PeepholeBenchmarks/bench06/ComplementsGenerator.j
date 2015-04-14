.class public ComplementsGenerator

.super java/lang/Object

.field protected complementNumber I
.field protected r Ljoos/lib/JoosRandom;

.method public <init>()V
  .limit locals 1
  .limit stack 3
  aload_0
  invokenonvirtual java/lang/Object/<init>()V
  new joos/lib/JoosRandom
  dup
  iconst_1
  invokenonvirtual joos/lib/JoosRandom/<init>(I)V
  dup
  aload_0
  swap
  putfield ComplementsGenerator/r Ljoos/lib/JoosRandom;
  pop
  return
.end method

.method public generateComment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .limit locals 6
  .limit stack 3
  aload_0
  getfield ComplementsGenerator/r Ljoos/lib/JoosRandom;
  invokevirtual joos/lib/JoosRandom/nextInt()I
  istore 4
  iload 4
  ldc 12
  irem
  istore 5
  iload 5
  iconst_0
  if_icmplt true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq else_0
  iload 5
  ldc 12
  iadd
  dup
  aload_0
  swap
  putfield ComplementsGenerator/complementNumber I
  pop
  goto stop_1
  else_0:
  iload 5
  dup
  aload_0
  swap
  putfield ComplementsGenerator/complementNumber I
  pop
  stop_1:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_0
  if_icmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq else_4
  ldc "I love how your hair smells like  a "
  dup
  ifnonnull stop_19
  pop
  ldc "null"
  stop_19:
  aload_1
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
  ldc " "
  dup
  ifnonnull stop_23
  pop
  ldc "null"
  stop_23:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_15
  pop
  ldc "null"
  stop_15:
  aload_3
  dup
  ifnonnull stop_25
  pop
  ldc "null"
  stop_25:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_13
  pop
  ldc "null"
  stop_13:
  ldc ". It makes me want to "
  dup
  ifnonnull stop_27
  pop
  ldc "null"
  stop_27:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_11
  pop
  ldc "null"
  stop_11:
  aload_2
  dup
  ifnonnull stop_29
  pop
  ldc "null"
  stop_29:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_9
  pop
  ldc "null"
  stop_9:
  ldc "."
  dup
  ifnonnull stop_31
  pop
  ldc "null"
  stop_31:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_5
  else_4:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_1
  if_icmpeq true_34
  iconst_0
  goto stop_35
  true_34:
  iconst_1
  stop_35:
  ifeq else_32
  ldc "I always admired you're "
  dup
  ifnonnull stop_43
  pop
  ldc "null"
  stop_43:
  aload_3
  dup
  ifnonnull stop_45
  pop
  ldc "null"
  stop_45:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_41
  pop
  ldc "null"
  stop_41:
  ldc ". I can't wait to "
  dup
  ifnonnull stop_47
  pop
  ldc "null"
  stop_47:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_39
  pop
  ldc "null"
  stop_39:
  aload_2
  dup
  ifnonnull stop_49
  pop
  ldc "null"
  stop_49:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_37
  pop
  ldc "null"
  stop_37:
  ldc " with you."
  dup
  ifnonnull stop_51
  pop
  ldc "null"
  stop_51:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_33
  else_32:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_2
  if_icmpeq true_54
  iconst_0
  goto stop_55
  true_54:
  iconst_1
  stop_55:
  ifeq else_52
  ldc "You remind me of my "
  dup
  ifnonnull stop_63
  pop
  ldc "null"
  stop_63:
  aload_3
  dup
  ifnonnull stop_65
  pop
  ldc "null"
  stop_65:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_61
  pop
  ldc "null"
  stop_61:
  ldc ". your "
  dup
  ifnonnull stop_67
  pop
  ldc "null"
  stop_67:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_59
  pop
  ldc "null"
  stop_59:
  aload_1
  dup
  ifnonnull stop_69
  pop
  ldc "null"
  stop_69:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_57
  pop
  ldc "null"
  stop_57:
  ldc " legs gives me the shivers."
  dup
  ifnonnull stop_71
  pop
  ldc "null"
  stop_71:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_53
  else_52:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_3
  if_icmpeq true_74
  iconst_0
  goto stop_75
  true_74:
  iconst_1
  stop_75:
  ifeq else_72
  ldc "I was "
  dup
  ifnonnull stop_83
  pop
  ldc "null"
  stop_83:
  aload_1
  dup
  ifnonnull stop_85
  pop
  ldc "null"
  stop_85:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_81
  pop
  ldc "null"
  stop_81:
  ldc " until I met you - and i can't "
  dup
  ifnonnull stop_87
  pop
  ldc "null"
  stop_87:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_79
  pop
  ldc "null"
  stop_79:
  aload_2
  dup
  ifnonnull stop_89
  pop
  ldc "null"
  stop_89:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_77
  pop
  ldc "null"
  stop_77:
  ldc " ever since."
  dup
  ifnonnull stop_91
  pop
  ldc "null"
  stop_91:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_73
  else_72:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_4
  if_icmpeq true_94
  iconst_0
  goto stop_95
  true_94:
  iconst_1
  stop_95:
  ifeq else_92
  ldc "I can't wait to show you my "
  dup
  ifnonnull stop_103
  pop
  ldc "null"
  stop_103:
  aload_3
  dup
  ifnonnull stop_105
  pop
  ldc "null"
  stop_105:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_101
  pop
  ldc "null"
  stop_101:
  ldc ". I have a feeling you will "
  dup
  ifnonnull stop_107
  pop
  ldc "null"
  stop_107:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_99
  pop
  ldc "null"
  stop_99:
  aload_2
  dup
  ifnonnull stop_109
  pop
  ldc "null"
  stop_109:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_97
  pop
  ldc "null"
  stop_97:
  ldc "."
  dup
  ifnonnull stop_111
  pop
  ldc "null"
  stop_111:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_93
  else_92:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  iconst_5
  if_icmpeq true_114
  iconst_0
  goto stop_115
  true_114:
  iconst_1
  stop_115:
  ifeq else_112
  ldc "If you'll leave me it will be a "
  dup
  ifnonnull stop_123
  pop
  ldc "null"
  stop_123:
  aload_3
  dup
  ifnonnull stop_125
  pop
  ldc "null"
  stop_125:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_121
  pop
  ldc "null"
  stop_121:
  ldc ". I would rather be "
  dup
  ifnonnull stop_127
  pop
  ldc "null"
  stop_127:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_119
  pop
  ldc "null"
  stop_119:
  aload_1
  dup
  ifnonnull stop_129
  pop
  ldc "null"
  stop_129:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_117
  pop
  ldc "null"
  stop_117:
  ldc "."
  dup
  ifnonnull stop_131
  pop
  ldc "null"
  stop_131:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_113
  else_112:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ldc 6
  if_icmpeq true_134
  iconst_0
  goto stop_135
  true_134:
  iconst_1
  stop_135:
  ifeq else_132
  ldc "I hope our "
  dup
  ifnonnull stop_147
  pop
  ldc "null"
  stop_147:
  aload_1
  dup
  ifnonnull stop_149
  pop
  ldc "null"
  stop_149:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_145
  pop
  ldc "null"
  stop_145:
  ldc " relationship will "
  dup
  ifnonnull stop_151
  pop
  ldc "null"
  stop_151:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_143
  pop
  ldc "null"
  stop_143:
  aload_2
  dup
  ifnonnull stop_153
  pop
  ldc "null"
  stop_153:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_141
  pop
  ldc "null"
  stop_141:
  ldc " like a "
  dup
  ifnonnull stop_155
  pop
  ldc "null"
  stop_155:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_139
  pop
  ldc "null"
  stop_139:
  aload_3
  dup
  ifnonnull stop_157
  pop
  ldc "null"
  stop_157:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_137
  pop
  ldc "null"
  stop_137:
  ldc "."
  dup
  ifnonnull stop_159
  pop
  ldc "null"
  stop_159:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_133
  else_132:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ldc 7
  if_icmpeq true_162
  iconst_0
  goto stop_163
  true_162:
  iconst_1
  stop_163:
  ifeq else_160
  ldc "You make me want to be a "
  dup
  ifnonnull stop_171
  pop
  ldc "null"
  stop_171:
  aload_1
  dup
  ifnonnull stop_173
  pop
  ldc "null"
  stop_173:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_169
  pop
  ldc "null"
  stop_169:
  ldc " man. from now on I'll "
  dup
  ifnonnull stop_175
  pop
  ldc "null"
  stop_175:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_167
  pop
  ldc "null"
  stop_167:
  aload_2
  dup
  ifnonnull stop_177
  pop
  ldc "null"
  stop_177:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_165
  pop
  ldc "null"
  stop_165:
  ldc " harder."
  dup
  ifnonnull stop_179
  pop
  ldc "null"
  stop_179:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_161
  else_160:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ldc 8
  if_icmpeq true_182
  iconst_0
  goto stop_183
  true_182:
  iconst_1
  stop_183:
  ifeq else_180
  ldc "Show me that "
  dup
  ifnonnull stop_191
  pop
  ldc "null"
  stop_191:
  aload_1
  dup
  ifnonnull stop_193
  pop
  ldc "null"
  stop_193:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_189
  pop
  ldc "null"
  stop_189:
  ldc " "
  dup
  ifnonnull stop_195
  pop
  ldc "null"
  stop_195:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_187
  pop
  ldc "null"
  stop_187:
  aload_3
  dup
  ifnonnull stop_197
  pop
  ldc "null"
  stop_197:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_185
  pop
  ldc "null"
  stop_185:
  ldc " of yours! "
  dup
  ifnonnull stop_199
  pop
  ldc "null"
  stop_199:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_181
  else_180:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ldc 9
  if_icmpeq true_202
  iconst_0
  goto stop_203
  true_202:
  iconst_1
  stop_203:
  ifeq else_200
  ldc "Let's "
  dup
  ifnonnull stop_211
  pop
  ldc "null"
  stop_211:
  aload_2
  dup
  ifnonnull stop_213
  pop
  ldc "null"
  stop_213:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_209
  pop
  ldc "null"
  stop_209:
  ldc " all night long, you "
  dup
  ifnonnull stop_215
  pop
  ldc "null"
  stop_215:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_207
  pop
  ldc "null"
  stop_207:
  aload_1
  dup
  ifnonnull stop_217
  pop
  ldc "null"
  stop_217:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_205
  pop
  ldc "null"
  stop_205:
  ldc " lady, you..."
  dup
  ifnonnull stop_219
  pop
  ldc "null"
  stop_219:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_201
  else_200:
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ldc 10
  if_icmpeq true_222
  iconst_0
  goto stop_223
  true_222:
  iconst_1
  stop_223:
  ifeq else_220
  ldc "Show me your "
  dup
  ifnonnull stop_227
  pop
  ldc "null"
  stop_227:
  aload_3
  dup
  ifnonnull stop_229
  pop
  ldc "null"
  stop_229:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_225
  pop
  ldc "null"
  stop_225:
  ldc " and I'll show you mine."
  dup
  ifnonnull stop_231
  pop
  ldc "null"
  stop_231:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  goto stop_221
  else_220:
  ldc "you are my "
  dup
  ifnonnull stop_243
  pop
  ldc "null"
  stop_243:
  aload_3
  dup
  ifnonnull stop_245
  pop
  ldc "null"
  stop_245:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_241
  pop
  ldc "null"
  stop_241:
  ldc " my only "
  dup
  ifnonnull stop_247
  pop
  ldc "null"
  stop_247:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_239
  pop
  ldc "null"
  stop_239:
  aload_3
  dup
  ifnonnull stop_249
  pop
  ldc "null"
  stop_249:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_237
  pop
  ldc "null"
  stop_237:
  ldc " , you make me "
  dup
  ifnonnull stop_251
  pop
  ldc "null"
  stop_251:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_235
  pop
  ldc "null"
  stop_235:
  aload_1
  dup
  ifnonnull stop_253
  pop
  ldc "null"
  stop_253:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  dup
  ifnonnull stop_233
  pop
  ldc "null"
  stop_233:
  ldc " when skies are grey."
  dup
  ifnonnull stop_255
  pop
  ldc "null"
  stop_255:
  invokevirtual java/lang/String/concat(Ljava/lang/String;)Ljava/lang/String;
  areturn
  stop_221:
  stop_201:
  stop_181:
  stop_161:
  stop_133:
  stop_113:
  stop_93:
  stop_73:
  stop_53:
  stop_33:
  stop_5:
  nop
.end method

.method public getComplementNumber()I
  .limit locals 1
  .limit stack 1
  aload_0
  getfield ComplementsGenerator/complementNumber I
  ireturn
  nop
.end method

.method public generateAdjective()Ljava/lang/String;
  .limit locals 3
  .limit stack 2
  aload_0
  getfield ComplementsGenerator/r Ljoos/lib/JoosRandom;
  invokevirtual joos/lib/JoosRandom/nextInt()I
  ldc 10
  irem
  istore_1
  iload_1
  iconst_0
  if_icmplt true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq else_0
  iload_1
  ldc 10
  iadd
  istore_2
  goto stop_1
  else_0:
  iload_1
  istore_2
  stop_1:
  iload_2
  iconst_0
  if_icmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq else_4
  ldc "dead"
  areturn
  goto stop_5
  else_4:
  iload_2
  iconst_1
  if_icmpeq true_10
  iconst_0
  goto stop_11
  true_10:
  iconst_1
  stop_11:
  ifeq else_8
  ldc "beautiful"
  areturn
  goto stop_9
  else_8:
  iload_2
  iconst_2
  if_icmpeq true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  ifeq else_12
  ldc "single"
  areturn
  goto stop_13
  else_12:
  iload_2
  iconst_3
  if_icmpeq true_18
  iconst_0
  goto stop_19
  true_18:
  iconst_1
  stop_19:
  ifeq else_16
  ldc "blind"
  areturn
  goto stop_17
  else_16:
  iload_2
  iconst_4
  if_icmpeq true_22
  iconst_0
  goto stop_23
  true_22:
  iconst_1
  stop_23:
  ifeq else_20
  ldc "enormous"
  areturn
  goto stop_21
  else_20:
  iload_2
  iconst_5
  if_icmpeq true_26
  iconst_0
  goto stop_27
  true_26:
  iconst_1
  stop_27:
  ifeq else_24
  ldc "sexy"
  areturn
  goto stop_25
  else_24:
  iload_2
  ldc 6
  if_icmpeq true_30
  iconst_0
  goto stop_31
  true_30:
  iconst_1
  stop_31:
  ifeq else_28
  ldc "talented"
  areturn
  goto stop_29
  else_28:
  iload_2
  ldc 7
  if_icmpeq true_34
  iconst_0
  goto stop_35
  true_34:
  iconst_1
  stop_35:
  ifeq else_32
  ldc "better"
  areturn
  goto stop_33
  else_32:
  iload_2
  ldc 8
  if_icmpeq true_38
  iconst_0
  goto stop_39
  true_38:
  iconst_1
  stop_39:
  ifeq else_36
  ldc "happy"
  areturn
  goto stop_37
  else_36:
  ldc "crappy"
  areturn
  stop_37:
  stop_33:
  stop_29:
  stop_25:
  stop_21:
  stop_17:
  stop_13:
  stop_9:
  stop_5:
  nop
.end method

.method public generateNoun()Ljava/lang/String;
  .limit locals 3
  .limit stack 2
  aload_0
  getfield ComplementsGenerator/r Ljoos/lib/JoosRandom;
  invokevirtual joos/lib/JoosRandom/nextInt()I
  ldc 9
  irem
  istore_1
  iload_1
  iconst_0
  if_icmplt true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq else_0
  iload_1
  ldc 9
  iadd
  istore_2
  goto stop_1
  else_0:
  iload_1
  istore_2
  stop_1:
  iload_1
  iconst_0
  if_icmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq else_4
  ldc "fruit"
  areturn
  goto stop_5
  else_4:
  iload_2
  iconst_1
  if_icmpeq true_10
  iconst_0
  goto stop_11
  true_10:
  iconst_1
  stop_11:
  ifeq else_8
  ldc "work-ethic"
  areturn
  goto stop_9
  else_8:
  iload_2
  iconst_2
  if_icmpeq true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  ifeq else_12
  ldc "niece"
  areturn
  goto stop_13
  else_12:
  iload_2
  iconst_3
  if_icmpeq true_18
  iconst_0
  goto stop_19
  true_18:
  iconst_1
  stop_19:
  ifeq else_16
  ldc "problems"
  areturn
  goto stop_17
  else_16:
  iload_2
  iconst_4
  if_icmpeq true_22
  iconst_0
  goto stop_23
  true_22:
  iconst_1
  stop_23:
  ifeq else_20
  ldc "tragedy"
  areturn
  goto stop_21
  else_20:
  iload_2
  iconst_5
  if_icmpeq true_26
  iconst_0
  goto stop_27
  true_26:
  iconst_1
  stop_27:
  ifeq else_24
  ldc "dream"
  areturn
  goto stop_25
  else_24:
  iload_2
  ldc 6
  if_icmpeq true_30
  iconst_0
  goto stop_31
  true_30:
  iconst_1
  stop_31:
  ifeq else_28
  ldc "sunshine"
  areturn
  goto stop_29
  else_28:
  iload_2
  ldc 7
  if_icmpeq true_34
  iconst_0
  goto stop_35
  true_34:
  iconst_1
  stop_35:
  ifeq else_32
  ldc "raccoon"
  areturn
  goto stop_33
  else_32:
  ldc "skin"
  areturn
  stop_33:
  stop_29:
  stop_25:
  stop_21:
  stop_17:
  stop_13:
  stop_9:
  stop_5:
  nop
.end method

.method public generateVerb()Ljava/lang/String;
  .limit locals 3
  .limit stack 2
  aload_0
  getfield ComplementsGenerator/r Ljoos/lib/JoosRandom;
  invokevirtual joos/lib/JoosRandom/nextInt()I
  ldc 10
  irem
  istore_1
  iload_1
  iconst_0
  if_icmplt true_2
  iconst_0
  goto stop_3
  true_2:
  iconst_1
  stop_3:
  ifeq else_0
  iload_1
  ldc 10
  iadd
  istore_2
  goto stop_1
  else_0:
  iload_1
  istore_2
  stop_1:
  iload_1
  iconst_0
  if_icmpeq true_6
  iconst_0
  goto stop_7
  true_6:
  iconst_1
  stop_7:
  ifeq else_4
  ldc "rot"
  areturn
  goto stop_5
  else_4:
  iload_2
  iconst_1
  if_icmpeq true_10
  iconst_0
  goto stop_11
  true_10:
  iconst_1
  stop_11:
  ifeq else_8
  ldc "cry"
  areturn
  goto stop_9
  else_8:
  iload_2
  iconst_2
  if_icmpeq true_14
  iconst_0
  goto stop_15
  true_14:
  iconst_1
  stop_15:
  ifeq else_12
  ldc "puke"
  areturn
  goto stop_13
  else_12:
  iload_2
  iconst_3
  if_icmpeq true_18
  iconst_0
  goto stop_19
  true_18:
  iconst_1
  stop_19:
  ifeq else_16
  ldc "work"
  areturn
  goto stop_17
  else_16:
  iload_2
  iconst_4
  if_icmpeq true_22
  iconst_0
  goto stop_23
  true_22:
  iconst_1
  stop_23:
  ifeq else_20
  ldc "sleep"
  areturn
  goto stop_21
  else_20:
  iload_2
  iconst_5
  if_icmpeq true_26
  iconst_0
  goto stop_27
  true_26:
  iconst_1
  stop_27:
  ifeq else_24
  ldc "be-pleased"
  areturn
  goto stop_25
  else_24:
  iload_2
  ldc 6
  if_icmpeq true_30
  iconst_0
  goto stop_31
  true_30:
  iconst_1
  stop_31:
  ifeq else_28
  ldc "flourish"
  areturn
  goto stop_29
  else_28:
  iload_2
  ldc 7
  if_icmpeq true_34
  iconst_0
  goto stop_35
  true_34:
  iconst_1
  stop_35:
  ifeq else_32
  ldc "nibble"
  areturn
  goto stop_33
  else_32:
  iload_2
  ldc 8
  if_icmpeq true_38
  iconst_0
  goto stop_39
  true_38:
  iconst_1
  stop_39:
  ifeq else_36
  ldc "program"
  areturn
  goto stop_37
  else_36:
  ldc "eat-bananas"
  areturn
  stop_37:
  stop_33:
  stop_29:
  stop_25:
  stop_21:
  stop_17:
  stop_13:
  stop_9:
  stop_5:
  nop
.end method

