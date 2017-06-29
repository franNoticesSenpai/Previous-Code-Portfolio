#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "io.h"
#include "40.h"


struct resortType {
    char *name;
    char *city;
    enum ratingType rating;
};

char *ratings[] = {"*", "**", "***", "****", "*****"};
char *name;
char *city;
enum ratingType rating;
struct resortType* getResorts(unsigned num)
{

// If num is 0, NULL is returned.
    if (num == 0) {
        return NULL;
    }

// Returns a pointer to an array containing the entered resort information.
    struct resortType *resorts = calloc(num, sizeof(struct resortType));

// If num is not null, but memory could not be allocated, NULL is returned.
    if (num != 0 && resorts == NULL) {
        return NULL;
    }

    for (int i = 0; i < num; i++) {
        char *error = NULL;
        resorts[i].name = getFilteredString("Enter in a resort!", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ", &error);

        resorts[i].city = getFilteredString("Enter in a city for the resort!", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ", &error);

        resorts[i].rating = getUnsigned();

// If invalid strings or ratings are entered, the corresponding entries are
// set to "" or UNACCEPTABLE.
        if (resorts[i].name == NULL) { //Should this be resort[i].name == NULL instead?
            resorts[i].name = "";
        }
        if (resorts[i].city == NULL) { //Should this be resort[i].city == NULL instead?
            resorts[i].city = "";
        }
        if (resorts[i].rating == 0 || resorts[i].rating > 5) {
            resorts[i].rating = UNACCEPTABLE;
        }
    }
//Return statement to return the values
    return resorts;
}

bool printResorts(struct resortType* resorts, unsigned num, char *fileName)
{

// Prints resort information to the file called 'fileName'.
    FILE *file;
    file = fopen(fileName, "w");
    if (file == NULL || fileName == NULL || resorts == NULL) {
        return false;
    } else {
        for (int i = 0; i < num; i++) {
            fprintf(file, "%s\t", resorts[i].name );
        fprintf(file, "%s\t", resorts[i].city);
            fprintf(file,"%s\n", ratings[resorts[i].rating-1]);
        }
    }
    fclose(file);
    return true;
}

void sortResorts(struct resortType *resorts, unsigned num)
{
    if (!num || resorts == NULL) {
        return;
    }
    struct resortType tmp;
    unsigned i, j;
    for (i = 0; i < (num - 1); i++) {
        for(j = 1; j < num - i; j++) {
            int compare = strcmp(resorts[j - 1].name, resorts[j].name);
            if (compare > 0) {
                tmp = resorts[j-1];
                resorts[j-1] = resorts[j];
                resorts[j] = tmp;
            } 
        }
    }
}