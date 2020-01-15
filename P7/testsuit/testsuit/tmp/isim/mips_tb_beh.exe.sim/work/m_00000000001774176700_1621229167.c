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
static int ng0[] = {0, 0};
static int ng1[] = {32, 0};
static int ng2[] = {1, 0};
static const char *ng3 = "%d@%h: $%d <= %h";



static void Cont_35_0(char *t0)
{
    char t5[8];
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
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1840);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1840);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 1152U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 3144);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 3084);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_36_1(char *t0)
{
    char t5[8];
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
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1840);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t6 = (t0 + 1840);
    t7 = (t6 + 44U);
    t8 = *((char **)t7);
    t9 = (t0 + 1840);
    t10 = (t9 + 40U);
    t11 = *((char **)t10);
    t12 = (t0 + 1244U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 3180);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 3092);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Initial_38_2(char *t0)
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

LAB0:
LAB2:    t1 = ((char*)((ng0)));
    t2 = (t0 + 1932);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 1932);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng1)));
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
LAB4:
LAB6:    t12 = ((char*)((ng0)));
    t13 = (t0 + 1840);
    t16 = (t0 + 1840);
    t17 = (t16 + 44U);
    t18 = *((char **)t17);
    t19 = (t0 + 1840);
    t20 = (t19 + 40U);
    t21 = *((char **)t20);
    t22 = (t0 + 1932);
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

LAB8:    t1 = (t0 + 1932);
    t2 = (t1 + 36U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 1932);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t13, t12, 0, *((unsigned int *)t15), t35);
    goto LAB8;

}

static void Always_43_3(char *t0)
{
    char t6[8];
    char t30[8];
    char t31[8];
    char t53[8];
    char t59[8];
    char t92[8];
    char t93[8];
    char t109[16];
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
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    int t107;
    int t108;

LAB0:    t1 = (t0 + 2888U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3100);
    *((int *)t2) = 1;
    t3 = (t0 + 2916);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:
LAB5:    t4 = (t0 + 968U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng2)));
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

LAB11:    t2 = (t0 + 1336U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng0)));
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
        goto LAB21;

LAB20:    if (t18 != 0)
        goto LAB22;

LAB23:    memset(t30, 0, 8);
    t8 = (t6 + 4);
    t23 = *((unsigned int *)t8);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t8) != 0)
        goto LAB26;

LAB27:    t22 = (t30 + 4);
    t45 = *((unsigned int *)t30);
    t46 = *((unsigned int *)t22);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB28;

LAB29:    memcpy(t59, t30, 8);

LAB30:    t84 = (t59 + 4);
    t85 = *((unsigned int *)t84);
    t86 = (~(t85));
    t87 = *((unsigned int *)t59);
    t88 = (t87 & t86);
    t89 = (t88 != 0);
    if (t89 > 0)
        goto LAB42;

LAB43:
LAB44:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:
LAB13:    t28 = ((char*)((ng0)));
    t29 = (t0 + 1932);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 32);

LAB14:    t2 = (t0 + 1932);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
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

LAB15:
LAB17:    t8 = ((char*)((ng0)));
    t21 = (t0 + 1840);
    t22 = (t0 + 1840);
    t28 = (t22 + 44U);
    t29 = *((char **)t28);
    t32 = (t0 + 1840);
    t33 = (t32 + 40U);
    t34 = *((char **)t33);
    t35 = (t0 + 1932);
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
        goto LAB18;

LAB19:    t2 = (t0 + 1932);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1932);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB14;

LAB18:    t16 = *((unsigned int *)t30);
    t17 = *((unsigned int *)t31);
    t43 = (t16 - t17);
    t44 = (t43 + 1);
    xsi_vlogvar_wait_assign_value(t21, t8, 0, *((unsigned int *)t31), t44, 0LL);
    goto LAB19;

LAB21:    *((unsigned int *)t6) = 1;
    goto LAB23;

LAB22:    t7 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB23;

LAB24:    *((unsigned int *)t30) = 1;
    goto LAB27;

LAB26:    t21 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB27;

LAB28:    t28 = (t0 + 1060U);
    t29 = *((char **)t28);
    memset(t31, 0, 8);
    t28 = (t29 + 4);
    t48 = *((unsigned int *)t28);
    t49 = (~(t48));
    t50 = *((unsigned int *)t29);
    t51 = (t50 & t49);
    t52 = (t51 & 1U);
    if (t52 != 0)
        goto LAB34;

LAB32:    if (*((unsigned int *)t28) == 0)
        goto LAB31;

LAB33:    t32 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t32) = 1;

LAB34:    memset(t53, 0, 8);
    t33 = (t31 + 4);
    t54 = *((unsigned int *)t33);
    t55 = (~(t54));
    t56 = *((unsigned int *)t31);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t33) != 0)
        goto LAB37;

LAB38:    t60 = *((unsigned int *)t30);
    t61 = *((unsigned int *)t53);
    t62 = (t60 & t61);
    *((unsigned int *)t59) = t62;
    t35 = (t30 + 4);
    t36 = (t53 + 4);
    t37 = (t59 + 4);
    t63 = *((unsigned int *)t35);
    t64 = *((unsigned int *)t36);
    t65 = (t63 | t64);
    *((unsigned int *)t37) = t65;
    t66 = *((unsigned int *)t37);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB30;

LAB31:    *((unsigned int *)t31) = 1;
    goto LAB34;

LAB35:    *((unsigned int *)t53) = 1;
    goto LAB38;

LAB37:    t34 = (t53 + 4);
    *((unsigned int *)t53) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB38;

LAB39:    t68 = *((unsigned int *)t59);
    t69 = *((unsigned int *)t37);
    *((unsigned int *)t59) = (t68 | t69);
    t38 = (t30 + 4);
    t40 = (t53 + 4);
    t70 = *((unsigned int *)t30);
    t71 = (~(t70));
    t72 = *((unsigned int *)t38);
    t73 = (~(t72));
    t74 = *((unsigned int *)t53);
    t75 = (~(t74));
    t76 = *((unsigned int *)t40);
    t77 = (~(t76));
    t39 = (t71 & t73);
    t41 = (t75 & t77);
    t78 = (~(t39));
    t79 = (~(t41));
    t80 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t80 & t78);
    t81 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t81 & t79);
    t82 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t82 & t78);
    t83 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t83 & t79);
    goto LAB41;

LAB42:
LAB45:    t90 = (t0 + 1428U);
    t91 = *((char **)t90);
    t90 = (t0 + 1840);
    t94 = (t0 + 1840);
    t95 = (t94 + 44U);
    t96 = *((char **)t95);
    t97 = (t0 + 1840);
    t98 = (t97 + 40U);
    t99 = *((char **)t98);
    t100 = (t0 + 1336U);
    t101 = *((char **)t100);
    xsi_vlog_generic_convert_array_indices(t92, t93, t96, t99, 2, 1, t101, 5, 2);
    t100 = (t92 + 4);
    t102 = *((unsigned int *)t100);
    t42 = (!(t102));
    t103 = (t93 + 4);
    t104 = *((unsigned int *)t103);
    t43 = (!(t104));
    t44 = (t42 && t43);
    if (t44 == 1)
        goto LAB46;

LAB47:    t2 = xsi_vlog_time(t109, 1000.0000000000000, 1000.0000000000000);
    t3 = (t0 + 784U);
    t4 = *((char **)t3);
    t3 = (t0 + 1336U);
    t5 = *((char **)t3);
    t3 = (t0 + 1428U);
    t7 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng3, 5, t0, (char)118, t109, 64, (char)118, t4, 32, (char)118, t5, 5, (char)118, t7, 32);
    goto LAB44;

LAB46:    t105 = *((unsigned int *)t92);
    t106 = *((unsigned int *)t93);
    t107 = (t105 - t106);
    t108 = (t107 + 1);
    xsi_vlogvar_wait_assign_value(t90, t91, 0, *((unsigned int *)t93), t108, 0LL);
    goto LAB47;

}


extern void work_m_00000000001774176700_1621229167_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Cont_36_1,(void *)Initial_38_2,(void *)Always_43_3};
	xsi_register_didat("work_m_00000000001774176700_1621229167", "isim/mips_tb_beh.exe.sim/work/m_00000000001774176700_1621229167.didat");
	xsi_register_executes(pe);
}
