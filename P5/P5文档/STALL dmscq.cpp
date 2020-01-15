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
char a[10010]; 
int main(){
	int i=0;
	char c=getchar();
	while(~c)a[i++]=(c=='M')?'W':c,c=getchar();
	printf("%s",a);
	for(i=0;a[i];i++)if(a[i]=='E')a[i]='M';
	printf("%s",a);
	for(i=0;a[i];i++)if(a[i]=='M')a[i]='W';
	printf("%s",a);
	return 0;
}
