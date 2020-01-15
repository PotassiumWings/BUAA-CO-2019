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
    char t41[8];
    char t42[8];
    char t60[8];
    char t61[8];
    char t80[8];
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
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    char *t85;
    char *t86;

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

LAB16:    t81 = (t0 + 2236);
    t82 = (t81 + 32U);
    t83 = *((char **)t82);
    t84 = (t83 + 40U);
    t85 = *((char **)t84);
    memcpy(t85, t3, 8);
    xsi_driver_vfirst_trans(t81, 0, 31);
    t86 = (t0 + 2192);
    *((int *)t86) = 1;

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
    memset(t23, 0, 8);
    t16 = (t24 + 4);
    t25 = *((unsigned int *)t16);
    t26 = (~(t25));
    t27 = *((unsigned int *)t24);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t16) != 0)
        goto LAB19;

LAB20:    t31 = (t23 + 4);
    t32 = *((unsigned int *)t23);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB21;

LAB22:    t37 = *((unsigned int *)t23);
    t38 = (~(t37));
    t39 = *((unsigned int *)t31);
    t40 = (t38 || t39);
    if (t40 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t31) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t23) > 0)
        goto LAB27;

LAB28:    memcpy(t22, t41, 8);

LAB29:    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t17, 32, t22, 32);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t23) = 1;
    goto LAB20;

LAB19:    t30 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB20;

LAB21:    t35 = (t0 + 692U);
    t36 = *((char **)t35);
    goto LAB22;

LAB23:    t35 = (t0 + 1060U);
    t43 = *((char **)t35);
    memset(t42, 0, 8);
    t35 = (t43 + 4);
    t44 = *((unsigned int *)t35);
    t45 = (~(t44));
    t46 = *((unsigned int *)t43);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB30;

LAB31:    if (*((unsigned int *)t35) != 0)
        goto LAB32;

LAB33:    t50 = (t42 + 4);
    t51 = *((unsigned int *)t42);
    t52 = *((unsigned int *)t50);
    t53 = (t51 || t52);
    if (t53 > 0)
        goto LAB34;

LAB35:    t56 = *((unsigned int *)t42);
    t57 = (~(t56));
    t58 = *((unsigned int *)t50);
    t59 = (t57 || t58);
    if (t59 > 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t50) > 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t42) > 0)
        goto LAB40;

LAB41:    memcpy(t41, t60, 8);

LAB42:    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t22, 32, t36, 32, t41, 32);
    goto LAB29;

LAB27:    memcpy(t22, t36, 8);
    goto LAB29;

LAB30:    *((unsigned int *)t42) = 1;
    goto LAB33;

LAB32:    t49 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB33;

LAB34:    t54 = (t0 + 692U);
    t55 = *((char **)t54);
    goto LAB35;

LAB36:    t54 = (t0 + 1152U);
    t62 = *((char **)t54);
    memset(t61, 0, 8);
    t54 = (t62 + 4);
    t63 = *((unsigned int *)t54);
    t64 = (~(t63));
    t65 = *((unsigned int *)t62);
    t66 = (t65 & t64);
    t67 = (t66 & 1U);
    if (t67 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t54) != 0)
        goto LAB45;

LAB46:    t69 = (t61 + 4);
    t70 = *((unsigned int *)t61);
    t71 = *((unsigned int *)t69);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB47;

LAB48:    t75 = *((unsigned int *)t61);
    t76 = (~(t75));
    t77 = *((unsigned int *)t69);
    t78 = (t76 || t77);
    if (t78 > 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t69) > 0)
        goto LAB51;

LAB52:    if (*((unsigned int *)t61) > 0)
        goto LAB53;

LAB54:    memcpy(t60, t80, 8);

LAB55:    goto LAB37;

LAB38:    xsi_vlog_unsigned_bit_combine(t41, 32, t55, 32, t60, 32);
    goto LAB42;

LAB40:    memcpy(t41, t55, 8);
    goto LAB42;

LAB43:    *((unsigned int *)t61) = 1;
    goto LAB46;

LAB45:    t68 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t68) = 1;
    goto LAB46;

LAB47:    t73 = (t0 + 784U);
    t74 = *((char **)t73);
    goto LAB48;

LAB49:    t73 = (t0 + 876U);
    t79 = *((char **)t73);
    t73 = ((char*)((ng1)));
    memset(t80, 0, 8);
    xsi_vlog_unsigned_add(t80, 32, t79, 32, t73, 32);
    goto LAB50;

LAB51:    xsi_vlog_unsigned_bit_combine(t60, 32, t74, 32, t80, 32);
    goto LAB55;

LAB53:    memcpy(t60, t74, 8);
    goto LAB55;

}


extern void work_m_00000000001671163920_0757879789_init()
{
	static char *pe[] = {(void *)Cont_32_0};
	xsi_register_didat("work_m_00000000001671163920_0757879789", "isim/mips_isim_beh.exe.sim/work/m_00000000001671163920_0757879789.didat");
	xsi_register_executes(pe);
}
