#include <iostream>
#include <string>
#include <print>
#include <map>

int main() {
    bool isrunning = true;
    std::map<std::string, std::string> myDictionary;
    while (isrunning){
        std::string loginsignup;
        std::string newname;
        std::string newpassword;
        std::string nameinput;
        std::string passinput;
        

        std::print("Sign up or log in: ");
        std::getline(std::cin, loginsignup);

        if (loginsignup == "sign up"){
            std::print("Username: ");
            std::getline(std::cin, newname);
            std::print("Password: ");
            std::getline(std::cin, newpassword);
            myDictionary[newname] = newpassword;
            std::println("Username: {}, Password: {}", newname, newpassword);
        };

        if (loginsignup == "log in"){
            std::print("Username: ");
            std::getline(std::cin, nameinput);
            std::print("Password: ");
            std::getline(std::cin, passinput);
            for (std::pair<std::string, std::string> pair : myDictionary){
                if (nameinput == pair.first and passinput == pair.second){
                    std::println("You're in!");
                    isrunning = false;
                    goto correct;
                }              
            }
            std::println("wrong");
            
            correct: ;

        };
    }
}