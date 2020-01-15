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
char a[10000],b[10010];
void delspace(char *a){
	int i,j=0;
	for(i=0;a[i];i++)
		if(a[i]!=' ')a[j++]=a[i];
	a[j]='\0';
}
int find(const char *a,const char s[]){
	return strstr(a,s)!=NULL;
}
int main(){
	int i;
	FILE *marsf=fopen("marsResult.txt","r");
	FILE *verif=fopen("verilogOut.txt","r");
	FILE *marsF=fopen("marsResult2.txt","w");
	FILE *veriF=fopen("verilogOut2.txt","w");
	while(fgets(a,1000,marsf)){
		delspace(a);
		if(!find(a,"$0")&&find(a,"@"))
			fprintf(marsF,"%s",a);
	}
	while(fgets(a,1000,verif)){
		delspace(a);
		for(i=0;a[i];i++)if(a[i]=='@')break;
		i+=5;//@0000xxxx
		if(!find(a,"$0"))
			fprintf(veriF,"@%s",a+i);
	}
	fclose(marsf);
	fclose(verif);
	fclose(veriF);
	fclose(marsF);
	
	FILE *marsF2=fopen("marsResult2.txt","r");
	FILE *veriF2=fopen("verilogOut2.txt","r");
	int cnt=0;
	FILE *log=fopen("log.txt","w");
	while(fgets(a,1000,marsF2)&&fgets(b,1000,veriF2)){
		cnt++;
		while(a[strlen(a)-1]=='\n')a[strlen(a)-1]=0;
		while(b[strlen(b)-1]=='\n')b[strlen(b)-1]=0;
		if(strcmp(a,b))fprintf(log,"wrong on line %d:output %s, expected %s.\n",cnt,b,a);
	}
	fclose(marsF2);
	fclose(veriF2);
	fclose(log);
	return 0;
}

