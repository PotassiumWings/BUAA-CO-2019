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
static const char *ng0 = "C:/Users/mumuy/Desktop/ISE/pipelineCPU10/DM.v";
static int ng1[] = {0, 0};
static int ng2[] = {1024, 0};
static int ng3[] = {1, 0};
static const char *ng4 = "%d@%h: *%h <= %h";



static void Initial_32_0(char *t0)
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

LAB0:    xsi_set_current_line(32, ng0);

LAB2:    xsi_set_current_line(33, ng0);
    xsi_set_current_line(33, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1380);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 1380);
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

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB6:    xsi_set_current_line(34, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 1472);
    t16 = (t0 + 1472);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = (t0 + 1472);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    t22 = (t0 + 1380);
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

LAB8:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1380);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 1380);
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
    char t5[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 2140U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1472);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1472);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t13 = (t0 + 600U);
    t14 = *((char **)t13);
    memset(t12, 0, 8);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 2);
    *((unsigned int *)t12) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 2);
    *((unsigned int *)t13) = t19;
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 1023U);
    t21 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t21 & 1023U);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t12, 10, 2);
    t22 = (t0 + 2532);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    t25 = (t24 + 40U);
    t26 = *((char **)t25);
    memcpy(t26, t5, 8);
    xsi_driver_vfirst_trans(t22, 0, 31);
    t27 = (t0 + 2480);
    *((int *)t27) = 1;

LAB1:    return;
}

static void Always_38_2(char *t0)
{
    char t6[8];
    char t30[8];
    char t31[8];
    char t45[8];
    char t57[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    int t39;
    char *t40;
    int t41;
    int t42;
    int t43;
    int t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;

LAB0:    t1 = (t0 + 2284U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 2488);
    *((int *)t2) = 1;
    t3 = (t0 + 2312);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t5);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB22;

LAB19:    if (t18 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t6) = 1;

LAB22:    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB23;

LAB24:
LAB25:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(39, ng0);

LAB13:    xsi_set_current_line(40, ng0);
    xsi_set_current_line(40, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1380);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 32);

LAB14:    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t9 = *((unsigned int *)t7);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB15;

LAB16:    goto LAB12;

LAB15:    xsi_set_current_line(40, ng0);
    t8 = ((char*)((ng1)));
    t21 = (t0 + 1472);
    t22 = (t0 + 1472);
    t28 = (t22 + 44U);
    t29 = *((char **)t28);
    t32 = (t0 + 1472);
    t33 = (t32 + 40U);
    t34 = *((char **)t33);
    t35 = (t0 + 1380);
    t36 = (t35 + 36U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t30, t31, t29, t34, 2, 1, t37, 32, 1);
    t38 = (t30 + 4);
    t14 = *((unsigned int *)t38);
    t39 = (!(t14));
    t40 = (t31 + 4);
    t15 = *((unsigned int *)t40);
    t41 = (!(t15));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB17;

LAB18:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1380);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB14;

LAB17:    t16 = *((unsigned int *)t30);
    t17 = *((unsigned int *)t31);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_assign_value(t21, t8, 0, *((unsigned int *)t31), t44);
    goto LAB18;

LAB21:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB22;

LAB23:    xsi_set_current_line(42, ng0);

LAB26:    xsi_set_current_line(43, ng0);
    t21 = (t0 + 692U);
    t22 = *((char **)t21);
    t21 = (t0 + 1472);
    t28 = (t0 + 1472);
    t29 = (t28 + 44U);
    t32 = *((char **)t29);
    t33 = (t0 + 1472);
    t34 = (t33 + 40U);
    t35 = *((char **)t34);
    t36 = (t0 + 600U);
    t37 = *((char **)t36);
    memset(t45, 0, 8);
    t36 = (t45 + 4);
    t38 = (t37 + 4);
    t46 = *((unsigned int *)t37);
    t47 = (t46 >> 2);
    *((unsigned int *)t45) = t47;
    t48 = *((unsigned int *)t38);
    t49 = (t48 >> 2);
    *((unsigned int *)t36) = t49;
    t50 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t50 & 1023U);
    t51 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t51 & 1023U);
    xsi_vlog_generic_convert_array_indices(t30, t31, t32, t35, 2, 1, t45, 10, 2);
    t40 = (t30 + 4);
    t52 = *((unsigned int *)t40);
    t39 = (!(t52));
    t53 = (t31 + 4);
    t54 = *((unsigned int *)t53);
    t41 = (!(t54));
    t42 = (t39 && t41);
    if (t42 == 1)
        goto LAB27;

LAB28:    xsi_set_current_line(44, ng0);
    t2 = xsi_vlog_time(t57, 1000.0000000000000, 1000.0000000000000);
    t3 = (t0 + 1060U);
    t4 = *((char **)t3);
    t3 = (t0 + 600U);
    t5 = *((char **)t3);
    t3 = (t0 + 692U);
    t7 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng4, 5, t0, (char)118, t57, 64, (char)118, t4, 32, (char)118, t5, 32, (char)118, t7, 32);
    goto LAB25;

LAB27:    t55 = *((unsigned int *)t30);
    t56 = *((unsigned int *)t31);
    t43 = (t55 - t56);
    t44 = (t43 + 1);
    xsi_vlogvar_assign_value(t21, t22, 0, *((unsigned int *)t31), t44);
    goto LAB28;

}


extern void work_m_00000000004213119181_2924402094_init()
{
	static char *pe[] = {(void *)Initial_32_0,(void *)Cont_37_1,(void *)Always_38_2};
	xsi_register_didat("work_m_00000000004213119181_2924402094", "isim/mips_isim_beh.exe.sim/work/m_00000000004213119181_2924402094.didat");
	xsi_register_executes(pe);
}
