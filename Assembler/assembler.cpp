#include<iostream>
using namespace std;
#include "Assembler.h"

int main()
{
	Assembler assembler;
	assembler.encode("input.txt");
	assembler.output("output.txt");
}


