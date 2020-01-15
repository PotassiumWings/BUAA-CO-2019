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
static int ng0[] = {1, 0};
static int ng1[] = {0, 0};



static void Always_40_0(char *t0)
{
    char t6[8];
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

LAB0:    t1 = (t0 + 2732U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 2928);
    *((int *)t2) = 1;
    t3 = (t0 + 2760);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:
LAB5:    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng0)));
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

LAB11:    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t3 + 4);
    t9 = *((unsigned int *)t2);
    t10 = (~(t9));
    t11 = *((unsigned int *)t3);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB17;

LAB15:    if (*((unsigned int *)t2) == 0)
        goto LAB14;

LAB16:    t4 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t4) = 1;

LAB17:    t5 = (t6 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (~(t14));
    t16 = *((unsigned int *)t6);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB18;

LAB19:
LAB20:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:
LAB13:    t28 = ((char*)((ng1)));
    t29 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 32, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1840);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 5, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1932);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2116);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    goto LAB12;

LAB14:    *((unsigned int *)t6) = 1;
    goto LAB17;

LAB18:
LAB21:    t7 = (t0 + 876U);
    t8 = *((char **)t7);
    t7 = (t0 + 1656);
    xsi_vlogvar_wait_assign_value(t7, t8, 0, 0, 32, 0LL);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = (t0 + 1748);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    t2 = (t0 + 1060U);
    t3 = *((char **)t2);
    t2 = (t0 + 1840);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 5, 0LL);
    t2 = (t0 + 1244U);
    t3 = *((char **)t2);
    t2 = (t0 + 2024);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    t2 = (t0 + 1152U);
    t3 = *((char **)t2);
    t2 = (t0 + 1932);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    t2 = (t0 + 1336U);
    t3 = *((char **)t2);
    t2 = (t0 + 2116);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    t2 = (t0 + 1428U);
    t3 = *((char **)t2);
    t2 = (t0 + 2208);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    goto LAB20;

}


extern void work_m_00000000001587640936_4251300787_init()
{
	static char *pe[] = {(void *)Always_40_0};
	xsi_register_didat("work_m_00000000001587640936_4251300787", "isim/mips_tb_beh.exe.sim/work/m_00000000001587640936_4251300787.didat");
	xsi_register_executes(pe);
}
