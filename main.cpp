#include <iostream>
#include <string>
#include <print>

int main() {
    std::string username;
    std::string age;

    std::print("Name: ");
    std::getline(std::cin, username);

    std::print("Age: ");
    std::getline(std::cin, age);

    std::print("Your name is {}, and you are {} years old.\n", username, age);
}
