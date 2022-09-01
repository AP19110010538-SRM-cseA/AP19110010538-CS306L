#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Symbol
{
    char label[100];
    int address;
};

struct Symbol table[10][50];
int indexes[10] = {0};

int main(int argc, char **argv)
{

    int choice;

    do
    {
        printf("\nSYMBOL TABLE (HASH TABLE)\n");
        printf("\n1. INSERT");
        printf("\n2. SEARCH");
        printf("\n3. DISPLAY\n");
        printf("\n0. EXIT");

        printf("\n\nInput your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 0:
        {
            break;
        }
        case 1:
        {
            int n;
            printf("\nInput the number of symbols to input: ");
            scanf("%d", &n);

            for (int i = 0; i < n; i++)
            {
                struct Symbol symbol;
                printf("\nSymbol %d:", i + 1);
                printf("\nInput address: ");
                scanf("%d", &symbol.address);
                printf("Input label: ");
                scanf("%s", symbol.label);

                int len = strlen(symbol.label);
                int hash = len % 10;

                table[hash][indexes[hash]] = symbol;
                indexes[hash]++;
            }
            break;
        }
        case 2:
        {
            char label[100];
            printf("\nInput the label to search: ");
            scanf("%s", label);

            int len = strlen(label);
            int hash = len % 10;

            int found = 0;
            for (int i = 0; i < indexes[hash]; i++)
            {
                if (strcmp(label, table[hash][i].label) == 0)
                {
                    printf("\nSymbol found!\n");
                    printf("\nAddress: %d", table[hash][i].address);
                    printf("\nLabel: %s\n", table[hash][i].label);
                    found = 1;
                    break;
                }
            }

            if (!found)
            {
                printf("\nSymbol not found!\n");
            }
            break;
        }
        case 3:
        {
            for (int i = 0; i < 10; i++)
            {
                for (int j = 0; j < indexes[i]; j++)
                {
                    printf("%d\t%s\n", table[i][j].address, table[i][j].label);
                }
            }
            break;
        }
        default:
        {
            printf("\nInvalid option!\n");
        }
        }

    } while (choice);

    return 0;
}
