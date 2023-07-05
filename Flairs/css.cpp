#include "stdlib.h"
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(){

    string doll;
    int height = 0;
    ifstream in("flair_list.csv");
    ofstream out("css.txt");

    if (in) {
        while (in >> doll){
            out << ".flair-" << doll << " {width: 40px;height: 40px;background-position: 0 " << height << "px;}";
            height -= 40;
        }
    }

    in.close();
    out.close();

    return 0;
}