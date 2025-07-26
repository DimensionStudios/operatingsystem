#include <iostream>
#include <string>
#include <print>

int main() {
    std::string name;
    int age;

    std::println("Name: ");
    std::getline(std::cin, name);

    std::println("Age: ");
    std::cin >> age;

    std::cout << "Your name is " << name << ". And you are " << age << " years old\n";
}
