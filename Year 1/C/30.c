#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

#define INITIAL_SIZE 10
#define NUM_CHARS 256

/* This function will dynamically allocate the buffer size (by doubling it) and check if the size and array is empty. If it's not empty, it makes a new array. */
char *doubleArraySize(char *oldArray, unsigned int *size)
{

    if (*size == 0||*oldArray == 0) {
        return NULL;
    }
    unsigned int original = *size;
    *size=*size*2;
    char *newArray = calloc(*size, sizeof(char));
    unsigned int i = 0;

    for (i = 0; i < original; i++) {
        newArray[i] = oldArray[i];
    }
    return newArray;
}

/* This function will determine if the string entered in is null and increase the size as long as it's not the end character.*/
unsigned stringLength(char *string)
{
    unsigned j = 0;
    if (string == NULL) {
        return 0;
    }
    while (string[j] != '\0') {
        j++;
    }
    return j;
}


/* This is the main function that will get a buffer size, get user input and double the array size if the number of characters is bigger than 10. 
It also gets a filter string and tests if an element of the first array appears anywhere in the filter string. It then sends the filter string 
character back one afterwards. Lastly, it tests if the two weren't a match and assigns an error message. It then returns the input string once done.*/
char *getFilteredString(char *prompt, char *filter, char **errorMessage)
{

    int lengthOfFirstArray = 0;

    int sizeOfBuffer = 0;
    int bs=INITIAL_SIZE;
    unsigned i = 0;
    char *tmp = calloc(INITIAL_SIZE, sizeof(char));
    if (filter == NULL) {
        return NULL;
    }
    if (prompt != NULL) {
        printf ("%s\n", prompt);
    }
    do {

        tmp[i] = getc(stdin);
        i++;
        lengthOfFirstArray++;
        sizeOfBuffer++;
        if(sizeOfBuffer > bs) {
            char *newArray = doubleArraySize(tmp, &bs);
            *tmp = *newArray;
        }

    } while (tmp[i-1] != EOF && tmp[i-1] != '\n');
    tmp[i-1] = '\0';
    lengthOfFirstArray = lengthOfFirstArray - 1;
    unsigned j = 0;

    int lengthOfSecondArray = stringLength(filter);
    int counter = 0;
    int k = 0;
    for (i = 0; i < lengthOfSecondArray; i++) {
        if (tmp[k] == filter[i]) {
            counter++;
            k++;
            i = -1;
        }
    }
    if (counter != lengthOfFirstArray) {
        if (*errorMessage != NULL) {
            *errorMessage = "Found invalid character";
            return NULL;
        }
        *errorMessage = "Found invalid character";
        return NULL;
    }


    return tmp;
}
