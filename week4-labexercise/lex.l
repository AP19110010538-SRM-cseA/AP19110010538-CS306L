%{
	#include<stdio.h>
   #include<string.h>
	int i=0,j=0,cnt=0,n=0,com=0,scom=0;
	char st[10][10];
	int look_up(char st[10][10],char *id,int n);
%}
digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]\.[0-9]
%%
\n {scom=0;n++;}
"//" {scom=1;fprintf(yyout,"\n single line comment\n\n");}
"/*" {com=1;fprintf(yyout,"\n comment start\n");}
"*/" {com=0;fprintf(yyout,"\n comment end\n");}
int |
float |
char |
double |
void {if(!com&&!scom) fprintf(yyout," \n %s is keyword",yytext);}
"<=" {if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan or Equal to",yytext);}
"<" {if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Lessthan",yytext);}
">=" {if(!com) fprintf(yyout,"\n %s is Relational operator Greaterthan or Equal to",yytext);}
">" {if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Greaterthan",yytext);}
"==" {if(!com&&!scom) fprintf(yyout,"\n %s is Relational operator Equal to",yytext);}
"!=" {if (!com&&!scom) fprintf(yyout,"\n %s is Relational operator Not Equal to",yytext);}
"=" {fprintf(yyout,"\n %s is Assignment operator",yytext);}
{id} {fprintf(yyout,"\n %s is identifier",yytext);
		if (!lookup(st,yytext,i)){
			strcpy(st[i++],yytext);cnt++;}
	}
{num} {fprintf(yyout,"\n %s is float",yytext);}
{digit} {fprintf(yyout,"\n %s is digit",yytext);}
%%
main(int argc, char **argv)
{
	yyin=fopen(argv[1],"r");
	yyin =fopen("x.txt","r");
	yyout=fopen("y.txt","w");
	yylex();
	printf(" No of id are : %d ",cnt);
	printf("\n the contents of symbol table are :\n");
	for(j=0;j<i;j++)
		printf("\n %s",st[j]);
	printf(" \n\n\n no of lines = %d\n\n",n);
	
	
	

	return 0;
}
int lookup(char st[10][10],char *id,int n)
{
	for(j=0;j<n;j++)
	if(!strcmp(st[j],id))
	return 1;
	return 0;
}
int yywrap()
{
return 1;
}
