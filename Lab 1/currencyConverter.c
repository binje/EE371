//  preprocessor directive to support printing to the display
#include <stdio.h>

//  the main program
int main(void)
{
  	//  declare, define, and initialize some working variables
    float rate = 0.0;
    float orig = 0.0;
    float newValue = 0.0;
    float direction = 0.0;

    //  ask the user for some data
    printf("What is the conversion rate \n");
	printf("from dollars to the foreign currency?\n");

	//  get the data from the user
	//   the data will be a floating point number: %f
	//   stored in the variable 'a'
	//   the & operator takes the address of the variable 'a'
	scanf("%f", &rate);

	//  remove newline from input buffer
	getchar();

	printf("How much would you like to convert?\n");
    //  get the data from the user
	//   the data will be a floating point number: %f
	//   stored in the variable 'a'
	//   the & operator takes the address of the variable 'a'
	scanf("%f", &orig);

	//  remove newline from input buffer
	getchar();

    printf("Would you like to convert to dollars or foreign currency?\n");
    printf("if you'd like dollars enter: 1\n");
    printf("if you'd like foreign currency: 0\n");

    //  get the data from the user
	//   the data will be a floating point number: %f
	//   stored in the variable 'a'
	//   the & operator takes the address of the variable 'a'
	scanf("%f", &direction);

	//  remove newline from input buffer
	getchar();

	if(direction) {
        //converter given currency into dollars currency
        newValue = orig / rate;

        printf("That would be %2.2f in dollars\n", newValue);
	} else {
        //converter given currency into foreign currency
        newValue = orig * rate;

        printf("That would be %2.2f in foreign currency\n", newValue);
	}


  return 0;
}
