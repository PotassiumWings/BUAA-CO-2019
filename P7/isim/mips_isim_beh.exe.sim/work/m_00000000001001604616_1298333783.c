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
static const char *ng0 = "C:/Users/mumuy/Desktop/CO/p7-new/IFID.v";
static int ng1[] = {0, 0};



static void Always_36_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;

LAB0:    t1 = (t0 + 2272U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 2468);
    *((int *)t2) = 1;
    t3 = (t0 + 2300);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 784U);
    t5 = *((char **)t4);
    t4 = (t0 + 876U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 | t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB6;

LAB7:
LAB8:    t34 = (t7 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t7);
    t38 = (t37 & t36);
    t39 = (t38 != 0);
    if (t39 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 & 1U);
    if (t14 != 0)
        goto LAB19;

LAB17:    if (*((unsigned int *)t2) == 0)
        goto LAB16;

LAB18:    t4 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t4) = 1;

LAB19:    t5 = (t7 + 4);
    t15 = *((unsigned int *)t5);
    t16 = (~(t15));
    t17 = *((unsigned int *)t7);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB20;

LAB21:
LAB22:
LAB11:    goto LAB2;

LAB6:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = *((unsigned int *)t21);
    t27 = (~(t26));
    t28 = *((unsigned int *)t6);
    t29 = (t28 & t27);
    t30 = (~(t25));
    t31 = (~(t29));
    t32 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t32 & t30);
    t33 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t33 & t31);
    goto LAB8;

LAB9:    xsi_set_current_line(37, ng0);

LAB12:    xsi_set_current_line(38, ng0);
    t40 = ((char*)((ng1)));
    t41 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t41, t40, 0, 0, 32, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 692U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t8 = *((unsigned int *)t2);
    t9 = (~(t8));
    t10 = *((unsigned int *)t3);
    t13 = (t10 & t9);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB15:    goto LAB11;

LAB13:    xsi_set_current_line(43, ng0);
    t4 = (t0 + 1244U);
    t5 = *((char **)t4);
    t4 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    goto LAB15;

LAB16:    *((unsigned int *)t7) = 1;
    goto LAB19;

LAB20:    xsi_set_current_line(46, ng0);

LAB23:    xsi_set_current_line(47, ng0);
    t6 = (t0 + 1060U);
    t11 = *((char **)t6);
    t6 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t6, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1152U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t8 = *((unsigned int *)t3);
    t9 = *((unsigned int *)t2);
    t10 = (t8 ^ t9);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t5);
    t15 = (t13 ^ t14);
    t16 = (t10 | t15);
    t17 = *((unsigned int *)t4);
    t18 = *((unsigned int *)t5);
    t19 = (t17 | t18);
    t22 = (~(t19));
    t23 = (t16 & t22);
    if (t23 != 0)
        goto LAB25;

LAB24:    if (t19 != 0)
        goto LAB26;

LAB27:    t11 = (t7 + 4);
    t24 = *((unsigned int *)t11);
    t26 = (~(t24));
    t27 = *((unsigned int *)t7);
    t28 = (t27 & t26);
    t30 = (t28 != 0);
    if (t30 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(51, ng0);

LAB32:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);

LAB30:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1152U);
    t3 = *((char **)t2);
    t2 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB22;

LAB25:    *((unsigned int *)t7) = 1;
    goto LAB27;

LAB26:    t6 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB27;

LAB28:    xsi_set_current_line(48, ng0);

LAB31:    xsi_set_current_line(49, ng0);
    t12 = ((char*)((ng1)));
    t20 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t20, t12, 0, 0, 32, 0LL);
    goto LAB30;

}


extern void work_m_00000000001001604616_1298333783_init()
{
	static char *pe[] = {(void *)Always_36_0};
	xsi_register_didat("work_m_00000000001001604616_1298333783", "isim/mips_isim_beh.exe.sim/work/m_00000000001001604616_1298333783.didat");
	xsi_register_executes(pe);
}
