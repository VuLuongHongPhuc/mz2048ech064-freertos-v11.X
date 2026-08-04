/* Avoid stdio.h/stdlib.h for sprintf/itoa/utoa 
 *  -> generate error "stack overflow" with freeRTOS. Stack size too small?
 * 
 * Rewrite fonction
 */


//#include <stddef.h>
#include "format_string.h"

/*** MACRO ********************************************************************/
static inline int32_t M_ABS(int32_t a)
{
    if (a<0)
    {
        return (int32_t)(-a);
    }
    else
    {
        return (int32_t)a;
    }
}

// Fonction pour échanger deux nombres
static inline void swap(char *x, char *y)
{
    char t = *x;
    *x = *y;
    *y = t;
}
 
// Fonction pour inverser `buffer[i?j]`
static inline char* reverse(char *buffer, int i, int j)
{
    while (i < j) 
    {
        swap(&buffer[i++], &buffer[j--]);
    }
 
    return buffer;
}




// Fonction itérative pour implémenter la fonction `itoa()` en C
char* itoa(int32_t value, char* buffer, int8_t baseType)
{
    // entrée invalide
    if (baseType < 2 || baseType > 32)
    {
        buffer[0] = '\0';
        return buffer;
    }
 
    // considère la valeur absolue du nombre
    int32_t n = M_ABS(value);
 
    int i = 0;
    while (n)
    {
        int r = n % baseType;
 
        if (r >= 10)
        {
            buffer[i++] = 65 + (r - 10);
        }
        else
        {
            buffer[i++] = 48 + r;
        }
 
        n = n / baseType;
    }
 
    // si le nombre est 0
    if (i == 0)
    {
        buffer[i++] = '0';
    }
 
    // Si la baseType est 10 et la valeur est négative, la string résultante
    // est précédé d'un signe moins (-)
    // Avec toute autre baseType, la valeur est toujours considérée comme non signée
    if (value < 0 && baseType == 10)
    {
        buffer[i++] = '-';
    }
 
    buffer[i] = '\0'; // string de fin nulle
 
    // inverse la string et la renvoie
    return reverse(buffer, 0, i - 1);
}


// unsigned to char
void utoa(uint32_t value, char * c, int8_t baseType)
{
    // == (void) sprintf(buffer, "%u", n);
    
    int8_t i;
    uint8_t n;
    uint8_t temp;
    uint8_t demi;
    uint8_t debut=0;
    
    // hexa
    if (baseType==16)
    {
        i = 32;
        
        do
        {
            temp = (uint8_t)(value>>(i-8));
            n = 2;
            
            do
            {
                demi = (uint8_t)((temp >> 4*(n-1) & 0xf));
                
                if ((demi==0) && (debut==0))
                {
                    n--;
                    continue;
                }
                
                debut=1;
                
                if ((demi >= 0) && (demi <= 9))
                {// 0..9
                    *c = 0x30+demi;
                    
                    // decale le pointer de 1 caractere    
                    c++;                    
                }
                else if ((demi >= 10) && (demi <= 15))
                {//A..F
                    //UPPER
                    *c = 0x41+demi-10;
                    
                    //LOWER
                    //*c = 0x61+demi-10;
                    
                    // decale le pointer de 1 caractere
                    c++;
                }
                else
                {// rien a faire                    
                }
                
                n--;
                
            }while(n>0);
            
            i -= 8;
            
        }while(i>0);
        
        *c = '\0';//terminaison string
    }
    else
    {
        *c = '\0';//terminaison string
    }
    
}

/*
char * utox(uint32_t n) {
    static char hexstr[sizeof(n)*2+1];
    char * p = hexstr + sizeof(hexstr) -1;
    int x;

    memset(hexstr, '0', sizeof(hexstr));

    *p-- = '\0';

    while (n) {
        x = n % 16;
        if (x < 10)
            *p-- = '0' + x;
        else
            *p-- = 'A' + x - 10;

        n /= 16;
    }

    return hexstr;
}
*/

/* *****************************************************************************
 End of File
 */
