#include<cstdio>
#include<algorithm>
#include<queue>
#include<map>
#include<cstring>
#include<cmath>
#include<cstdlib>
#include<set>
#include<unordered_map>
#include<vector>
#include<ctime> 
typedef long long ll;
using namespace std;
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
//-----------------------------------cal_r-------------------------
void addu(int rs,int rt,int rd){
	printf("addu $%d,$%d,$%d\n",rd,rt,rs);
	if(rd)grf[rd]=grf[rs]+grf[rt];
}
void subu(int rs,int rt,int rd){
	printf("subu $%d,$%d,$%d\n",rd,rt,rs);
	if(rd)grf[rd]=grf[rs]-grf[rt];
}
void ori(int rs,int rt,int imm){
	printf("ori $%d,$%d,%d\n",rt,rs,imm);
	if(rt)grf[rt]=grf[rs]|imm;
}
void lui(int rs,int rt,int imm){
	printf("lui $%d,%d\n",rs,imm);
	if(rs)grf[rs]=1u*imm<<16;
}
//-----------------------------------load--------------------------
void lw(int rs,int rt){
	int imm=rand()%1024*4;
	printf("lw $%d,%d($0)\n",rt,imm);
	grf[rt]=dm[imm/4];
}
void lb(int rs,int rt){//signed ext
	int imm=rand()%8192;
	int l[4]={0};
	l[0]=(1<<8)-1;
	l[1]=l[0]<<8;
	l[2]=l[1]<<8;
	l[3]=l[2]<<8;
	printf("lb $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(l[imm%4]))>>(imm%4*8);
	if(grf[rt]>>7)grf[rt]=signext(grf[rt],7);
}
void lbu(int rs,int rt){//unsigned
	int imm=rand()%8192;
	int l[4]={0};
	l[0]=(1<<8)-1;
	l[1]=l[0]<<8;
	l[2]=l[1]<<8;
	l[3]=l[2]<<8;
	printf("lb $%d,%d($0)\n",rt,imm);
	grf[rt]=(dm[imm/4]&(l[imm%4]))>>(imm%4*8);
}

//-----------------------------------store--------------------------
void sw(int rs,int rt){
	int imm=rand()%1024*4;
	printf("sw $%d,%d($0)\n",rt,imm);
	dm[imm/4]=grf[rt];
}
void sb(int rs,int rt){
	int imm=rand()%8192;
	int l[4]={0};
	l[0]=(1<<8)-1;
	l[1]=l[0]<<8;
	l[2]=l[1]<<8;
	l[3]=l[2]<<8;
	printf("sb $%d,%d($0)\n",rt,imm);
	dm[imm/4]&=~l[imm%4];
	dm[imm/4]|=(grf[rt]&l[0])<<(imm%4*8);
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
void nop(){
	printf("nop\n");
}
int main(){
	int i;
	srand(time(NULL));
	freopen("test.asm","w",stdout); 
	printf("subu $31,$31,$31\n");//Çå¿Õ$sp 
	int last=-1;
	for(i=0;i<1000;i++){
		printf("label%d: ",i);
		int instr=rand()%11;
		while((i<300||last==1)&&instr>=6&&instr<=9){//j+j
			instr=rand()%11;
		}
		int rs=R,rt=R,rd=R,imm=I;
		if(instr==0)addu(rs,rt,rd);
		else if(instr==1)subu(rs,rt,rd);
		else if(instr==2)ori(rs,rt,imm);
		else if(instr==3)lui(rs,0,imm);
		else if(instr==4)lbu(rs,rt);
		else if(instr==5)sb(rs,rt);
		else if(instr==6)blezbgez(rs,i);
		else if(instr==7)blezbgez(rs,i);
		else if(instr==8)blezbgez(rs,i);
		else if(instr==9){
			int yes=jr(rs,rt,i);
			if(!yes)instr=6;//beq
		}
		else nop();
		jump[i]=last=(instr>=6&&instr<=9);
	}
	printf("label:\n beq $0,$0,label\nnop"); 
	return 0;
}
