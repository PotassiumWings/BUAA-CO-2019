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
static const char *ng0 = "C:/Users/mumuy/Desktop/ISE/pipelineCPU10/NPC.v";
static int ng1[] = {4, 0};



static void Cont_32_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t22[8];
    char t23[8];
    char t26[8];
    char t70[8];
    char t71[8];
    char t90[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t89;
    char *t91;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;

LAB0:    t1 = (t0 + 1996U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1244U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t22, 8);

LAB16:    t91 = (t0 + 2236);
    t92 = (t91 + 32U);
    t93 = *((char **)t92);
    t94 = (t93 + 40U);
    t95 = *((char **)t94);
    memcpy(t95, t3, 8);
    xsi_driver_vfirst_trans(t91, 0, 31);
    t96 = (t0 + 2192);
    *((int *)t96) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 600U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = (t0 + 968U);
    t24 = *((char **)t16);
    t16 = (t0 + 1060U);
    t25 = *((char **)t16);
    t27 = *((unsigned int *)t24);
    t28 = *((unsigned int *)t25);
    t29 = (t27 | t28);
    *((unsigned int *)t26) = t29;
    t16 = (t24 + 4);
    t30 = (t25 + 4);
    t31 = (t26 + 4);
    t32 = *((unsigned int *)t16);
    t33 = *((unsigned int *)t30);
    t34 = (t32 | t33);
    *((unsigned int *)t31) = t34;
    t35 = *((unsigned int *)t31);
    t36 = (t35 != 0);
    if (t36 == 1)
        goto LAB17;

LAB18:
LAB19:    memset(t23, 0, 8);
    t53 = (t26 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t26);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t53) != 0)
        goto LAB22;

LAB23:    t60 = (t23 + 4);
    t61 = *((unsigned int *)t23);
    t62 = *((unsigned int *)t60);
    t63 = (t61 || t62);
    if (t63 > 0)
        goto LAB24;

LAB25:    t66 = *((unsigned int *)t23);
    t67 = (~(t66));
    t68 = *((unsigned int *)t60);
    t69 = (t67 || t68);
    if (t69 > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t60) > 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t23) > 0)
        goto LAB30;

LAB31:    memcpy(t22, t70, 8);

LAB32:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t17, 32, t22, 32);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

LAB17:    t37 = *((unsigned int *)t26);
    t38 = *((unsigned int *)t31);
    *((unsigned int *)t26) = (t37 | t38);
    t39 = (t24 + 4);
    t40 = (t25 + 4);
    t41 = *((unsigned int *)t39);
    t42 = (~(t41));
    t43 = *((unsigned int *)t24);
    t44 = (t43 & t42);
    t45 = *((unsigned int *)t40);
    t46 = (~(t45));
    t47 = *((unsigned int *)t25);
    t48 = (t47 & t46);
    t49 = (~(t44));
    t50 = (~(t48));
    t51 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t51 & t49);
    t52 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t52 & t50);
    goto LAB19;

LAB20:    *((unsigned int *)t23) = 1;
    goto LAB23;

LAB22:    t59 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB23;

LAB24:    t64 = (t0 + 692U);
    t65 = *((char **)t64);
    goto LAB25;

LAB26:    t64 = (t0 + 1152U);
    t72 = *((char **)t64);
    memset(t71, 0, 8);
    t64 = (t72 + 4);
    t73 = *((unsigned int *)t64);
    t74 = (~(t73));
    t75 = *((unsigned int *)t72);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t64) != 0)
        goto LAB35;

LAB36:    t79 = (t71 + 4);
    t80 = *((unsigned int *)t71);
    t81 = *((unsigned int *)t79);
    t82 = (t80 || t81);
    if (t82 > 0)
        goto LAB37;

LAB38:    t85 = *((unsigned int *)t71);
    t86 = (~(t85));
    t87 = *((unsigned int *)t79);
    t88 = (t86 || t87);
    if (t88 > 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t79) > 0)
        goto LAB41;

LAB42:    if (*((unsigned int *)t71) > 0)
        goto LAB43;

LAB44:    memcpy(t70, t90, 8);

LAB45:    goto LAB27;

LAB28:    xsi_vlog_unsigned_bit_combine(t22, 32, t65, 32, t70, 32);
    goto LAB32;

LAB30:    memcpy(t22, t65, 8);
    goto LAB32;

LAB33:    *((unsigned int *)t71) = 1;
    goto LAB36;

LAB35:    t78 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t78) = 1;
    goto LAB36;

LAB37:    t83 = (t0 + 784U);
    t84 = *((char **)t83);
    goto LAB38;

LAB39:    t83 = (t0 + 876U);
    t89 = *((char **)t83);
    t83 = ((char*)((ng1)));
    memset(t90, 0, 8);
    xsi_vlog_unsigned_add(t90, 32, t89, 32, t83, 32);
    goto LAB40;

LAB41:    xsi_vlog_unsigned_bit_combine(t70, 32, t84, 32, t90, 32);
    goto LAB45;

LAB43:    memcpy(t70, t84, 8);
    goto LAB45;

}


extern void work_m_00000000003423122576_0757879789_init()
{
	static char *pe[] = {(void *)Cont_32_0};
	xsi_register_didat("work_m_00000000003423122576_0757879789", "isim/tb_isim_beh.exe.sim/work/m_00000000003423122576_0757879789.didat");
	xsi_register_executes(pe);
}
