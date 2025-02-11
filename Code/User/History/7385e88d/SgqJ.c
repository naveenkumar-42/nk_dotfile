#include <stdio.h>
#include <string.h>

int main() {
    char s[100];
    printf("Enter the string: ");
    scanf("%[^\n]", s);
    char arr[256]={0};
    int a=strlen(s);
    int i=0;
    while(i<a){
        arr[s[i++]]++;  
    }
    i=0;
    while(i<256){
        if(arr[i]==1){
            printf("%c first non repeating\n",i);
            break;
        }
        i++;
    }
    int len=256;
    while(len>=0){
        if(arr[len]==2){
            printf("%c last repeating character",len);
            break;
        }
        len--;
    }
}
