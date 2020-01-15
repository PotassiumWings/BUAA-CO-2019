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
typedef long long ll;
using namespace std;
int reg[]={0,1,2,3,4,5,6,29,30,31};
int main(){
	int i;
	freopen("test.asm","w",stdout);
	puts(".text");
	for(i=0;i<10;i++){
		printf("ori $%d,$0,0\n",reg[i]);
	}
	for(i=0;i<1000;i++){
		int r=rand()%8;
		if(r==0)printf("ori $%d,$%d,%d\n",reg[rand()%10],reg[rand()%10],rand());
		else if(r==1)printf("lui $%d,%d\n",reg[rand()%10],rand());
		else if(r==2)printf("add $%d,$%d,$%d\n",reg[rand()%10],reg[rand()%10],reg[rand()%10]);
		else if(r==3)printf("addi $%d,$%d,%d\n",reg[rand()%10],reg[rand()%10],rand());
		else if(r==4)printf("sub $%d,$%d,$%d\n",reg[rand()%10],reg[rand()%10],reg[rand()%10]);
		else if(r==5)printf("addu $%d,$%d,$%d\n",reg[rand()%10],reg[rand()%10],reg[rand()%10]);
		else if(r==6)printf("addiu $%d,$%d,%d\n",reg[rand()%10],reg[rand()%10],rand());
		else if(r==7)printf("sw $%d,%d($%d)\n",reg[rand()%10],rand(),reg[rand()%10]);
	}
	printf("label:\n");
	printf(" beq $0,$0,label\n nop\n");
	return 0;
}

