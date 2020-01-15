#include<stdio.h>
#include<string.h>
int goodnum[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100,200,300,400,500,600,700,800,900,1000,2000,3000,4000,5000,6000,7000,8000,9000};
char s[][20]={"ling",\
"yi"	 ,"er"	   ,"san"	  ,"si"		,"wu"	  ,"liu"	 ,"qi"	   ,"ba"	 ,"jiu"		,\
"yi shi" ,"er shi" ,"san shi" ,"si shi" ,"wu shi" ,"liu shi" ,"qi shi" ,"ba shi" ,"jiu shi" ,\
"yi bai" ,"er bai" ,"san bai" ,"si bai" ,"wu bai" ,"liu bai" ,"qi bai" ,"ba bai" ,"jiu bai" ,\
"yi qian","er qian","san qian","si qian","wu qian","liu qian","qi qian","ba qian","jiu qian",};
int value[]={0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3};
char t[100010];
int main(){
	int i,x;
	while(~scanf("%d",&x)){
		int v,v2;
		t[0]='\0';
		for(i=36;i>=0;i--){
			if(goodnum[i]<=x){
				v=value[i];
				x-=goodnum[i];
				strcat(t,s[i]);
				break;
			}
		}
		while(x){
			for(i=36;i>=0;i--){
				if(goodnum[i]<=x){
					v2=value[i];
					if(v2+1<v)strcat(t," ling");
					x-=goodnum[i];
					strcat(t," ");
					strcat(t,s[i]);
					v=v2;
					break;
				}
			}
		}
		printf("%s\n",t);
	}
	return 0;
}
