/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/mumuy/Desktop/CO/p7-new/IM.v";
static int ng1[] = {0, 0};
static int ng2[] = {4096, 0};
static int ng3[] = {1, 0};
static const char *ng4 = "code.txt";
static const char *ng5 = "code_handler.txt";
static int ng6[] = {1120, 0};
static int ng7[] = {2047, 0};
static unsigned int ng8[] = {20479U, 0U};
static unsigned int ng9[] = {12288U, 0U};
static unsigned int ng10[] = {0U, 0U};
static unsigned int ng11[] = {3072U, 0U};



static void Initial_29_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(29, ng0);

LAB2:    xsi_set_current_line(30, ng0);
    xsi_set_current_line(30, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1288);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 1288);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1196);
    xsi_vlogfile_readmemh(ng4, 0, t1, 0, 0, 0, 0);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1196);
    t2 = ((char*)((ng6)));
    t3 = ((char*)((ng7)));
    xsi_vlogfile_readmemh(ng5, 0, t1, 1, *((unsigned int *)t2), 1, *((unsigned int *)t3));

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB6:    xsi_set_current_line(31, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 1196);
    t16 = (t0 + 1196);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = (t0 + 1196);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    t22 = (t0 + 1288);
    t23 = (t22 + 36U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1288);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 1288);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t13, t12, 0, *((unsigned int *)t15), t35);
    goto LAB8;

}

static void Cont_37_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t10[8];
    char t25[8];
    char t29[8];
    char t37[8];
    char t65[8];
    char t78[8];
    char t79[8];
    char t96[8];
    char t104[8];
    char t148[8];
    char t149[8];
    char t153[8];
    char t182[8];
    char t228[8];
    char t235[8];
    char t246[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t80;
    char *t81;
    char *t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    char *t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    char *t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    char *t138;
    char *t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    char *t150;
    char *t151;
    char *t152;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    char *t157;
    char *t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    char *t166;
    char *t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    char *t180;
    char *t181;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    char *t186;
    char *t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    char *t195;
    char *t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    int t200;
    unsigned int t201;
    unsigned int t202;
    unsigned int t203;
    int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    unsigned int t208;
    char *t209;
    unsigned int t210;
    unsigned int t211;
    unsigned int t212;
    unsigned int t213;
    unsigned int t214;
    char *t215;
    char *t216;
    unsigned int t217;
    unsigned int t218;
    unsigned int t219;
    char *t220;
    unsigned int t221;
    unsigned int t222;
    unsigned int t223;
    unsigned int t224;
    char *t225;
    char *t226;
    char *t227;
    char *t229;
    char *t230;
    char *t231;
    char *t232;
    char *t233;
    char *t234;
    char *t236;
    char *t237;
    char *t238;
    unsigned int t239;
    unsigned int t240;
    unsigned int t241;
    unsigned int t242;
    unsigned int t243;
    unsigned int t244;
    char *t245;
    char *t247;
    char *t248;
    char *t249;
    char *t250;
    char *t251;
    char *t252;

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 600U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng8)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t8 = (t2 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t5) > *((unsigned int *)t2))
        goto LAB6;

LAB7:    memset(t10, 0, 8);
    t11 = (t6 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (~(t12));
    t14 = *((unsigned int *)t6);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t11) != 0)
        goto LAB11;

LAB12:    t18 = (t10 + 4);
    t19 = *((unsigned int *)t10);
    t20 = (!(t19));
    t21 = *((unsigned int *)t18);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    memcpy(t37, t10, 8);

LAB15:    memset(t65, 0, 8);
    t66 = (t37 + 4);
    t67 = *((unsigned int *)t66);
    t68 = (~(t67));
    t69 = *((unsigned int *)t37);
    t70 = (t69 & t68);
    t71 = (t70 & 1U);
    if (t71 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t66) != 0)
        goto LAB30;

LAB31:    t73 = (t65 + 4);
    t74 = *((unsigned int *)t65);
    t75 = (!(t74));
    t76 = *((unsigned int *)t73);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB32;

LAB33:    memcpy(t104, t65, 8);

LAB34:    memset(t4, 0, 8);
    t132 = (t104 + 4);
    t133 = *((unsigned int *)t132);
    t134 = (~(t133));
    t135 = *((unsigned int *)t104);
    t136 = (t135 & t134);
    t137 = (t136 & 1U);
    if (t137 != 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t132) != 0)
        goto LAB48;

LAB49:    t139 = (t4 + 4);
    t140 = *((unsigned int *)t4);
    t141 = *((unsigned int *)t139);
    t142 = (t140 || t141);
    if (t142 > 0)
        goto LAB50;

LAB51:    t144 = *((unsigned int *)t4);
    t145 = (~(t144));
    t146 = *((unsigned int *)t139);
    t147 = (t145 || t146);
    if (t147 > 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t139) > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t4) > 0)
        goto LAB56;

LAB57:    memcpy(t3, t148, 8);

LAB58:    t247 = (t0 + 2196);
    t248 = (t247 + 32U);
    t249 = *((char **)t248);
    t250 = (t249 + 40U);
    t251 = *((char **)t250);
    memcpy(t251, t3, 8);
    xsi_driver_vfirst_trans(t247, 0, 31);
    t252 = (t0 + 2152);
    *((int *)t252) = 1;

LAB1:    return;
LAB5:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t10) = 1;
    goto LAB12;

LAB11:    t17 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB12;

LAB13:    t23 = (t0 + 600U);
    t24 = *((char **)t23);
    t23 = ((char*)((ng9)));
    memset(t25, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB17;

LAB16:    t27 = (t23 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t24) < *((unsigned int *)t23))
        goto LAB18;

LAB19:    memset(t29, 0, 8);
    t30 = (t25 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t25);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t30) != 0)
        goto LAB23;

LAB24:    t38 = *((unsigned int *)t10);
    t39 = *((unsigned int *)t29);
    t40 = (t38 | t39);
    *((unsigned int *)t37) = t40;
    t41 = (t10 + 4);
    t42 = (t29 + 4);
    t43 = (t37 + 4);
    t44 = *((unsigned int *)t41);
    t45 = *((unsigned int *)t42);
    t46 = (t44 | t45);
    *((unsigned int *)t43) = t46;
    t47 = *((unsigned int *)t43);
    t48 = (t47 != 0);
    if (t48 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB15;

LAB17:    t28 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB19;

LAB18:    *((unsigned int *)t25) = 1;
    goto LAB19;

LAB21:    *((unsigned int *)t29) = 1;
    goto LAB24;

LAB23:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB24;

LAB25:    t49 = *((unsigned int *)t37);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t37) = (t49 | t50);
    t51 = (t10 + 4);
    t52 = (t29 + 4);
    t53 = *((unsigned int *)t51);
    t54 = (~(t53));
    t55 = *((unsigned int *)t10);
    t56 = (t55 & t54);
    t57 = *((unsigned int *)t52);
    t58 = (~(t57));
    t59 = *((unsigned int *)t29);
    t60 = (t59 & t58);
    t61 = (~(t56));
    t62 = (~(t60));
    t63 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t63 & t61);
    t64 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t64 & t62);
    goto LAB27;

LAB28:    *((unsigned int *)t65) = 1;
    goto LAB31;

LAB30:    t72 = (t65 + 4);
    *((unsigned int *)t65) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB31;

LAB32:    t80 = (t0 + 600U);
    t81 = *((char **)t80);
    memset(t79, 0, 8);
    t80 = (t79 + 4);
    t82 = (t81 + 4);
    t83 = *((unsigned int *)t81);
    t84 = (t83 >> 0);
    *((unsigned int *)t79) = t84;
    t85 = *((unsigned int *)t82);
    t86 = (t85 >> 0);
    *((unsigned int *)t80) = t86;
    t87 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t87 & 3U);
    t88 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t88 & 3U);
    memset(t78, 0, 8);
    t89 = (t79 + 4);
    t90 = *((unsigned int *)t89);
    t91 = (~(t90));
    t92 = *((unsigned int *)t79);
    t93 = (t92 & t91);
    t94 = (t93 & 3U);
    if (t94 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t89) != 0)
        goto LAB37;

LAB38:    memset(t96, 0, 8);
    t97 = (t78 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t78);
    t101 = (t100 & t99);
    t102 = (t101 & 1U);
    if (t102 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t97) != 0)
        goto LAB41;

LAB42:    t105 = *((unsigned int *)t65);
    t106 = *((unsigned int *)t96);
    t107 = (t105 | t106);
    *((unsigned int *)t104) = t107;
    t108 = (t65 + 4);
    t109 = (t96 + 4);
    t110 = (t104 + 4);
    t111 = *((unsigned int *)t108);
    t112 = *((unsigned int *)t109);
    t113 = (t111 | t112);
    *((unsigned int *)t110) = t113;
    t114 = *((unsigned int *)t110);
    t115 = (t114 != 0);
    if (t115 == 1)
        goto LAB43;

LAB44:
LAB45:    goto LAB34;

LAB35:    *((unsigned int *)t78) = 1;
    goto LAB38;

LAB37:    t95 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t95) = 1;
    goto LAB38;

LAB39:    *((unsigned int *)t96) = 1;
    goto LAB42;

LAB41:    t103 = (t96 + 4);
    *((unsigned int *)t96) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB42;

LAB43:    t116 = *((unsigned int *)t104);
    t117 = *((unsigned int *)t110);
    *((unsigned int *)t104) = (t116 | t117);
    t118 = (t65 + 4);
    t119 = (t96 + 4);
    t120 = *((unsigned int *)t118);
    t121 = (~(t120));
    t122 = *((unsigned int *)t65);
    t123 = (t122 & t121);
    t124 = *((unsigned int *)t119);
    t125 = (~(t124));
    t126 = *((unsigned int *)t96);
    t127 = (t126 & t125);
    t128 = (~(t123));
    t129 = (~(t127));
    t130 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t130 & t128);
    t131 = *((unsigned int *)t110);
    *((unsigned int *)t110) = (t131 & t129);
    goto LAB45;

LAB46:    *((unsigned int *)t4) = 1;
    goto LAB49;

LAB48:    t138 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t138) = 1;
    goto LAB49;

LAB50:    t143 = ((char*)((ng10)));
    goto LAB51;

LAB52:    t150 = (t0 + 692U);
    t151 = *((char **)t150);
    t150 = (t0 + 784U);
    t152 = *((char **)t150);
    t154 = *((unsigned int *)t151);
    t155 = *((unsigned int *)t152);
    t156 = (t154 | t155);
    *((unsigned int *)t153) = t156;
    t150 = (t151 + 4);
    t157 = (t152 + 4);
    t158 = (t153 + 4);
    t159 = *((unsigned int *)t150);
    t160 = *((unsigned int *)t157);
    t161 = (t159 | t160);
    *((unsigned int *)t158) = t161;
    t162 = *((unsigned int *)t158);
    t163 = (t162 != 0);
    if (t163 == 1)
        goto LAB59;

LAB60:
LAB61:    t180 = (t0 + 876U);
    t181 = *((char **)t180);
    t183 = *((unsigned int *)t153);
    t184 = *((unsigned int *)t181);
    t185 = (t183 | t184);
    *((unsigned int *)t182) = t185;
    t180 = (t153 + 4);
    t186 = (t181 + 4);
    t187 = (t182 + 4);
    t188 = *((unsigned int *)t180);
    t189 = *((unsigned int *)t186);
    t190 = (t188 | t189);
    *((unsigned int *)t187) = t190;
    t191 = *((unsigned int *)t187);
    t192 = (t191 != 0);
    if (t192 == 1)
        goto LAB62;

LAB63:
LAB64:    memset(t149, 0, 8);
    t209 = (t182 + 4);
    t210 = *((unsigned int *)t209);
    t211 = (~(t210));
    t212 = *((unsigned int *)t182);
    t213 = (t212 & t211);
    t214 = (t213 & 1U);
    if (t214 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t209) != 0)
        goto LAB67;

LAB68:    t216 = (t149 + 4);
    t217 = *((unsigned int *)t149);
    t218 = *((unsigned int *)t216);
    t219 = (t217 || t218);
    if (t219 > 0)
        goto LAB69;

LAB70:    t221 = *((unsigned int *)t149);
    t222 = (~(t221));
    t223 = *((unsigned int *)t216);
    t224 = (t222 || t223);
    if (t224 > 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t216) > 0)
        goto LAB73;

LAB74:    if (*((unsigned int *)t149) > 0)
        goto LAB75;

LAB76:    memcpy(t148, t228, 8);

LAB77:    goto LAB53;

LAB54:    xsi_vlog_unsigned_bit_combine(t3, 32, t143, 32, t148, 32);
    goto LAB58;

LAB56:    memcpy(t3, t143, 8);
    goto LAB58;

LAB59:    t164 = *((unsigned int *)t153);
    t165 = *((unsigned int *)t158);
    *((unsigned int *)t153) = (t164 | t165);
    t166 = (t151 + 4);
    t167 = (t152 + 4);
    t168 = *((unsigned int *)t166);
    t169 = (~(t168));
    t170 = *((unsigned int *)t151);
    t171 = (t170 & t169);
    t172 = *((unsigned int *)t167);
    t173 = (~(t172));
    t174 = *((unsigned int *)t152);
    t175 = (t174 & t173);
    t176 = (~(t171));
    t177 = (~(t175));
    t178 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t178 & t176);
    t179 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t179 & t177);
    goto LAB61;

LAB62:    t193 = *((unsigned int *)t182);
    t194 = *((unsigned int *)t187);
    *((unsigned int *)t182) = (t193 | t194);
    t195 = (t153 + 4);
    t196 = (t181 + 4);
    t197 = *((unsigned int *)t195);
    t198 = (~(t197));
    t199 = *((unsigned int *)t153);
    t200 = (t199 & t198);
    t201 = *((unsigned int *)t196);
    t202 = (~(t201));
    t203 = *((unsigned int *)t181);
    t204 = (t203 & t202);
    t205 = (~(t200));
    t206 = (~(t204));
    t207 = *((unsigned int *)t187);
    *((unsigned int *)t187) = (t207 & t205);
    t208 = *((unsigned int *)t187);
    *((unsigned int *)t187) = (t208 & t206);
    goto LAB64;

LAB65:    *((unsigned int *)t149) = 1;
    goto LAB68;

LAB67:    t215 = (t149 + 4);
    *((unsigned int *)t149) = 1;
    *((unsigned int *)t215) = 1;
    goto LAB68;

LAB69:    t220 = ((char*)((ng10)));
    goto LAB70;

LAB71:    t225 = (t0 + 1196);
    t226 = (t225 + 36U);
    t227 = *((char **)t226);
    t229 = (t0 + 1196);
    t230 = (t229 + 44U);
    t231 = *((char **)t230);
    t232 = (t0 + 1196);
    t233 = (t232 + 40U);
    t234 = *((char **)t233);
    t236 = (t0 + 600U);
    t237 = *((char **)t236);
    memset(t235, 0, 8);
    t236 = (t235 + 4);
    t238 = (t237 + 4);
    t239 = *((unsigned int *)t237);
    t240 = (t239 >> 2);
    *((unsigned int *)t235) = t240;
    t241 = *((unsigned int *)t238);
    t242 = (t241 >> 2);
    *((unsigned int *)t236) = t242;
    t243 = *((unsigned int *)t235);
    *((unsigned int *)t235) = (t243 & 4095U);
    t244 = *((unsigned int *)t236);
    *((unsigned int *)t236) = (t244 & 4095U);
    t245 = ((char*)((ng11)));
    memset(t246, 0, 8);
    xsi_vlog_unsigned_minus(t246, 12, t235, 12, t245, 12);
    xsi_vlog_generic_get_array_select_value(t228, 32, t227, t231, t234, 2, 1, t246, 12, 2);
    goto LAB72;

LAB73:    xsi_vlog_unsigned_bit_combine(t148, 32, t220, 32, t228, 32);
    goto LAB77;

LAB75:    memcpy(t148, t220, 8);
    goto LAB77;

}


extern void work_m_00000000003635625703_0467708899_init()
{
	static char *pe[] = {(void *)Initial_29_0,(void *)Cont_37_1};
	xsi_register_didat("work_m_00000000003635625703_0467708899", "isim/mips_isim_beh.exe.sim/work/m_00000000003635625703_0467708899.didat");
	xsi_register_executes(pe);
}
