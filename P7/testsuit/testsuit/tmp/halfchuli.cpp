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
char a[1010],b[1010];
int main(){
	FILE *mars=fopen("ans-pre.txt","r");
	FILE *verilog=fopen("out-pre.txt","r");
	FILE *mars2=fopen("ans-final.txt","w");
	FILE *verilog2=fopen("out-final.txt","w");
	while(fgets(a,1000,mars)&&fgets(b,1000,verilog)){
		fprintf(mars2,"%s\n",a);
		fprintf(verilog2,"%s\n",b);
	} 
	return 0;
}
