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
int signext(int x,int highest){
	int i,ans=0,sign=x>>highest;
	for(i=31;i>=highest;i--){
		ans+=(1u<<i)*sign;
	}
	return ans+x;
}
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
void lw(int rs,int rt){
	//addr:0-0x1000(end with 00)
	/*int addr=rand()%256,lo=((1<<16)-1),hi=lo<<16;
	int imm=addr*4-grf[rs];
	while((imm&hi)!=hi&&(imm&hi)!=0||(imm&lo)>32768){
		addr=rand()%256;
		rs=R;
		imm=addr*4-grf[rs];
	}
	printf("lw $%d,%d($%d)\n",rt,imm&((1<<16)-1),rs);
	if(rt)grf[rt]=dm[addr];*/
	int imm=rand()%1024*4;
	printf("lw $%d,%d($0)\n",rt,imm);
	grf[rt]=dm[imm/4];
}
void sw(int rs,int rt){
	//addr:0-0x1000(end with 00)
	/*int addr=rand()%256,lo=((1<<16)-1),hi=lo<<16;
	int imm=addr*4-grf[rs];
	while((imm&hi)!=hi&&(imm&hi)!=0||(imm&lo)>32768){
		addr=rand()%256;
		rs=R;
		imm=addr*4-grf[rs];
	}
	printf("sw $%d,%d($%d)\n",rt,imm&((1<<16)-1),rs);
	dm[addr]=grf[rt];*/
	int imm=rand()%1024*4;
	printf("sw $%d,%d($0)\n",rt,imm);
	dm[imm/4]=grf[rt];
}
int main(){
	int i;
	srand(time(NULL));
	freopen("test.asm","w",stdout); 
	printf("subu $31,$31,$31\n");
	for(i=0;i<500;i++){
		int instr=rand()%6;
		int rs=R,rt=R,rd=R,imm=I;
		if(instr==0)addu(rs,rt,rd);
		else if(instr==1)subu(rs,rt,rd);
		else if(instr==2)ori(rs,rt,imm);
		else if(instr==3)lui(rs,0,imm);
		else if(instr==4)lw(rs,rt);
		else if(instr==5)sw(rs,rt);
	}
	printf("label:\n beq $0,$0,label\nnop"); 
	return 0;
}
