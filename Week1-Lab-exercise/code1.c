#include<stdio.h>
void main()
{
    int state=0,i=0;
    char token,input[20];
    printf("Enter input string \t :");
    scanf("%s",input);
    //printf("Given string is : %s");

    while((token=input[i++])!='\0')
    {
       // printf("current token : %c \n",token);
        switch(state)
        {
            case 0: if(token=='a')
                        state=1;
                    else if(token=='b')
                        state=2;
                    else
                    {
                        printf("Invalid token");
                        exit(0);
                    }
                    break;
            case 1: if(token=='a')
                        state=0;
                    else if(token=='b')
                        state=3;
                    else
                    {
                        printf("Invalid token");
                        exit(0);
                    }

                    break;
            case 2: if(token=='a')
                        state=3;
                    else if(token=='b')
                        state=0;
                    else
                    {
                        printf("Invalid token");
                        exit(0);
                    }
                    break;
            case 3: if(token=='a')
                        state=2;
                    else if(token=='b')
                        state=1;
                    else
                    {
                        printf("Invalid token");
                        exit(0);
                    }
                    break;
        }
       // printf("state = %d  ",state);
    }
    if(state==0)
        printf("\n\nString accepted\n\n");
    else
        printf("\n\nString not accepted\n\n");
}
