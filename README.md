# Operating System
## Building
### Setup
If you have make already then run:

    make install_req_files

If you do not have make, than install it and run the command

## Rules
* Use c++ 23
* Run with clang
* Compile down to asm if needed (bootloader)
* Try to stick to one language
* If a var/func is private, start the name with "p_"
* Before you make a commit, always use cppcheck to make sure it is optimised (if using c++)
* Use the 'const' function whenever possible
* Do not use raw pointers unless it links to a C library, instead use smart pointers
* Once ready, we will only test the OS on a VM while on a call in case there is a big issue

 
## TODO
* Make ASM code run a c file
* Add C API's
* Make C run CPP files
* Make UI system
* Create apps

        ------------------------------------------------------------------------------------------------ 
