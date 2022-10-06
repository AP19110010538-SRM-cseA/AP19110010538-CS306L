#include<stdio.h>
#include<ctype.h>
void FIRST(char*,char);
void addToArray(char*,char);
void printArray(char*);
int n;
char production[20][20];
main()
{
    int i,j=0,k,foundNt=0;
    char c,result[20],nt[20];
    nt[0]='\0';
    printf("Enter number of productions :");
    scanf(" %d",&n);
    for(i=0;i<n;i++)
    {
        printf("Enter productions Number %d : ",i+1);
        scanf(" %s",production[i]);
        addToArray(nt,production[i][0]);
    }

    for(k=0;nt[k]!='\0';k++)
    {
        c=nt[k];
        FIRST(result,c);
        printf("\n FIRST(%c)= { ",c);
        printArray(result);
        printf("}\n");
    }
}

void FIRST(char* Result,char c)
{
    int i,j,k;
    char subResult[20];
    int foundEpsilon;
    subResult[0]='\0';
    Result[0]='\0';
    if(!(isupper(c)))
        addToArray(Result,c);
    else
        for(i=0;i<n;i++)
        {
            if(production[i][0]==c)
            {
                if(production[i][2]=='^')
                    addToArray(Result,'^');
                else
                {
                    for(j=2;production[i][j]!='\0';j++)
                    {
                        foundEpsilon=0;
                        FIRST(subResult,production[i][j]);

                        for(k=0;subResult[k]!='\0';k++)
                            if(subResult[k]=='^')
                                foundEpsilon=1;
                            else
                                addToArray(Result,subResult[k]);
                        if(!foundEpsilon)
                            break;
                    }
               }
            }
        }
    return ;
}

void addToArray(char *Result,char val)
{
    int k;
    for(k=0 ;Result[k]!='\0';k++)
        if(Result[k]==val)
            return;
    Result[k]=val;
    Result[k+1]='\0';
}
void printArray(char *a)
{
    int i=0;
    for(i=0;a[i]!='\0';i++)
      printf(" %c ",a[i]);
}
