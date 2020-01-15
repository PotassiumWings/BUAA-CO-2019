#include<cstdio>
#include<assert.h>
#include<stdlib.h>
#include<vector>
#include<ctime>
using namespace std;
typedef long long ll;
unsigned int grf[32];
int reg[]={0,1,2,3,31};
int dm[1024];
#define R reg[rand()%5]
#define I (rand()+rand())
#define B (rand()%650)
int signext(int x,int mx){
	int i;
	for(i=mx+1;i<=31;i++)x+=(1<<i);
	return x;
}
//-----------------------------------muldiv------------------------
int hi,lo;
void Div(int rs,int rt){
	if(grf[rt]==0)return;
	printf("div $%d,$%d\n",rs,rt);
	lo=grf[rs]/grf[rt];
	hi=grf[rs]%grf[rt];
}
void divu(int rs,int rt){
	if(grf[rt]==0)return;
	printf("divu $%d,$%d\n",rs,rt);
	lo=(unsigned int)grf[rs]/(unsigned int)grf[rt];
	hi=(unsigned int)grf[rs]%(unsigned int)grf[rt];
}
void mult(int rs,int rt){
	printf("mult $%d,$%d\n",rs,rt);
	lo=grf[rs]*grf[rt];
	hi=grf[rs]*(long long)grf[rt]>>32;
}
void multu(int rs,int rt){
	printf("multu $%d,$%d\n",rs,rt);
	lo=(unsigned long long)grf[rs]*(unsigned long long)grf[rt];
	hi=((unsigned long long)grf[rs]*(unsigned long long)grf[rt])>>32;
}
void mfhi(int rd){
	printf("mfhi $%d\n",rd);
	grf[rd]=hi;
}
void mflo(int rd){
	printf("mflo $%d\n",rd);
	grf[rd]=lo;
}
void mthi(int rs){
	printf("mthi $%d\n",rs);
	hi=grf[rs];
}
void mtlo(int rs){
	printf("mtlo $%d\n",rs);
	lo=grf[rs];
}
//-----------------------------------shift-------------------------
void sll(int rt,int rd,int s){
	assert(s<32);
	printf("sll $%d,$%d,$%d\n",rd,rt,s);
	if(rd)grf[rd]=grf[rt]<<s;
}
void sllv(int rs,int rt,int rd){
	printf("sllv $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rt]<<(grf[rs]&31);
}
void sra(int rt,int rd,int s){
	assert(s<32);
	printf("sra $%d,$%d,$%d\n",rd,rt,s);
	if(rd)grf[rd]=signext(grf[rt]>>s,31-s);
}
void srav(int rs,int rt,int rd){
	printf("srav $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=signext(grf[rt]>>(grf[rs]&31),31-(grf[rs]&31));
}
void srl(int rt,int rd,int s){
	assert(s<32);
	printf("srl $%d,$%d,$%d\n",rd,rt,s);
	if(rd)grf[rd]=grf[rt]>>s;
}
void srlv(int rs,int rt,int rd){
	printf("srlv $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rt]>>(grf[rs]&31);
}

//-----------------------------------cal_r-------------------------
void add(int rs,int rt,int rd){
	printf("add $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]+grf[rt];
}
void addu(int rs,int rt,int rd){
	printf("addu $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]+grf[rt];
}
void And(int rs,int rt,int rd){
	printf("and $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]&grf[rt];
}
void Nor(int rs,int rt,int rd){
	printf("nor $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=~(grf[rs]|grf[rt]);
}
void Or(int rs,int rt,int rd){
	printf("or $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]|grf[rt];
}
void sub(int rs,int rt,int rd){
	printf("sub $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]-grf[rt];
}
void subu(int rs,int rt,int rd){
	printf("subu $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]-grf[rt];
}
void slt(int rs,int rt,int rd){
	printf("slt $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]<grf[rt];
}
void sltu(int rs,int rt,int rd){
	printf("sltu $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=(unsigned int)grf[rs]<(unsigned int)grf[rt];
}
void Xor(int rs,int rt,int rd){
	printf("xor $%d,$%d,$%d\n",rd,rs,rt);
	if(rd)grf[rd]=grf[rs]^grf[rt];
}
//-----------------------------------cal_i-------------------------
void addi(int rs,int rt,int imm){
	printf("addi $%d,$%d,%d\n",rt,rs,imm);
	if(rt)grf[rt]=grf[rs]+signext(imm,15);
}
void addiu(int rs,int rt,int imm){
	printf("addiu $%d,$%d,%d\n",rt,rs,imm);
	if(rt)grf[rt]=grf[rs]+signext(imm,15);
}
void andi(int rs,int rt,int imm){
	printf("andi $%d,$%d,%d\n",rt,rs,imm);
	if(rt)grf[rt]=grf[rs]&imm;
}
void ori(int rs,int rt,int imm){
	printf("ori $%d,$%d,%d\n",rt,rs,imm);
	if(rt)grf[rt]=grf[rs]|imm;
}
void lui(int rs,int rt,int imm){
	printf("lui $%d,%d\n",rs,imm);
	if(rs)grf[rs]=1u*imm<<16;
}
void slti(int rs,int rt,int imm){
	printf("slti $%d,$%d,%d\n",rs,rt,imm);
	if(rt)grf[rt]=grf[rs]<signext(imm,15);
}
void sltiu(int rs,int rt,int imm){
	printf("sltiu $%d,$%d,%d\n",rs,rt,imm);
	if(rt)grf[rt]=(unsigned long long)grf[rs]<(unsigned long long)signext(imm,15);
}
void xori(int rs,int rt,int imm){
	printf("xori $%d,$%d,%d\n",rs,rt,imm);
	if(rt)grf[rt]=grf[rs]^imm;
}
//-----------------------------------load--------------------------
int l[4],h[2];
void lw(int rs,int rt){
	int imm=rand()%2048*4;
	printf("lw $%d,%d($0)\n",rt,imm);
	grf[rt]=dm[imm/4];
}
void lb(int rs,int rt){//signed ext
	int imm=rand()%8192;
	printf("lb $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(l[imm%4]))>>(imm%4*8);
	if(grf[rt]>>7)grf[rt]=signext(grf[rt],7);
}
void lbu(int rs,int rt){//unsigned
	int imm=rand()%8192;
	printf("lb $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(l[imm%4]))>>(imm%4*8);
}
void lh(int rs,int rt){//signed ext
	int imm=rand()%4096*2;
	printf("lh $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(h[(imm>>1)&1]))>>(((imm>>1)&1)*8);
	if(grf[rt]>>15)grf[rt]=signext(grf[rt],15);
}
void lhu(int rs,int rt){//unsigned
	int imm=rand()%4096*2;
	printf("lhu $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(h[(imm>>1)&1]))>>(((imm>>1)&1)*8);
}

//-----------------------------------store--------------------------
void sw(int rs,int rt){
	int imm=rand()%2048*4;
	printf("sw $%d,%d($0)\n",rt,imm);
	dm[imm/4]=grf[rt];
}
void sb(int rs,int rt){
	int imm=rand()%8192;
	printf("sb $%d,%d($0)\n",rt,imm);
	dm[imm/4]&=~l[imm%4];
	dm[imm/4]|=(grf[rt]&l[0])<<(imm%4*8);
}
void sh(int rs,int rt){//signed ext
	int imm=rand()%4096*2;
	printf("sh $%d,%d($0)\n",rt,imm);
	dm[imm/4]&=~h[(imm>>1)&1];
	dm[imm/4]|=(grf[rt]&(h[0]))<<((imm>>1)%2*16);
}

//-----------------------------------branch--------------------------
int jump[1010];

int produce(int i){
	if(i>800)return B;
	else if(rand()>30768)return i+rand()%200;
	else return i+rand()%10;
}
int producejumpaddr(int i){
	int add=produce(i);
	while(jump[add])add=produce(i);
	return add;
}

void beqbne(int rs,int rt,int i){
	int jaddr=producejumpaddr(i);
	if(rand()%2)printf("beq $%d,$%d,label%d\n",rs,rt,jaddr);
	else printf("bne $%d,$%d,label%d\n",rs,rt,jaddr);
}
void blezbgez(int rs,int i){
	int jaddr=producejumpaddr(i);
	if(rand()%2)printf("blez $%d,label%d\n",rs,jaddr);
	else printf("bgez $%d,label%d\n",rs,jaddr);
}
void bltzbgtz(int rs,int i){
	int jaddr=producejumpaddr(i);
	if(rand()%2)printf("bltz $%d,label%d\n",rs,jaddr);
	else printf("bgtz $%d,label%d\n",rs,jaddr);
}

//-----------------------------------jump----------------------------
void j(int i){
	int jaddr=producejumpaddr(i);
	printf("j label%d\n",jaddr);
}
void jal(int i){
	int jaddr=producejumpaddr(i);
	printf("jal label%d\n",jaddr);
}
int jr(int rs,int rt,int i){
	vector<int>can;
	can.clear();
	for(int i=0;i<5;i++)if(reg[i]>0x3000&&reg[i]<=0x3700)can.push_back(reg[i]);
	if(can.size()==0){
		beqbne(rs,rt,i);
		return 0;
	}
	rs=can[rand()%can.size()];
	printf("jr $%d\n",rs);
	return 1;
}
int jalr(int rs,int rt,int i){
	vector<int>can;
	can.clear();
	for(int i=0;i<5;i++)if(reg[i]>0x3000&&reg[i]<=0x3700)can.push_back(reg[i]);
	if(can.size()==0){
		beqbne(rs,rt,i);
		return 0;
	}
	rs=can[rand()%can.size()];
	printf("jalr $%d,$%d\n",rt,rs);
	return 1;
}
void nop(){
	printf("nop\n");
}
int main(){
	int i;
	l[0]=(1<<8)-1;l[1]=l[0]<<8;l[2]=l[1]<<8;l[3]=l[2]<<8;
	h[0]=(1<<16)-1;h[1]=h[0]<<16;
	srand(time(NULL));
	freopen("test8.asm","w",stdout); 
	printf("subu $31,$31,$31\n");//Çå¿Õ$sp 
	int last=-1;
	for(i=0;i<1000;i++){
		printf("label%d: ",i);
		int instr=rand()%11;
		while((i<300||last==1)&&instr>=6&&instr<=6){//j+j
			instr=rand()%11;
		}
		int rs=R,rt=R,rd=R,imm=I;
		if(instr==0)addu(rs,rt,rd);
		else if(instr==1){
			if(grf[rt]==0)mult(rs,rt);
			else divu(rs,rt);
		}
		else if(instr==2)mflo(rs);
		else if(instr==3)lui(rs,0,imm);
		else if(instr==4)lhu(rs,rt);
		else if(instr==5)sw(rs,rt);
		else if(instr==6)blezbgez(rs,i);
		else if(instr==7)mtlo(rs);
		else if(instr==8)mult(rs,rt);
		else if(instr==9)mthi(rs);
		else nop();
		jump[i]=last=(instr>=6&&instr<=6);
	}
	printf("label:\n beq $0,$0,label\nnop"); 
	return 0;
}
