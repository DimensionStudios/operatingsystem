# operatingsystem
RULES:  
    #use c++ 23  
    #run with clang  
    #compile down to asm if needed (bootloader)  
    #try to stick to one language  
    #if a var/func is private, start the name with "p_"  
    #Before you make a commit, always use cppcheck to make sure it is optimised (if using c++)  
    #Use the 'const' function whenever possible  
    #Do not use raw pointers unless it links to a C library, instead use smart pointers  
    #Once ready, we will only test the OS on a VM while on a call in case there is a big issue  

    ------------------------------------------------------------------------------------------------  
CPP TYPES:  
    static = in classes, do not need to make new class object  
    const = can't be changed  
    constexpr = made on boot  
    constinit = initalised on compile  
    consteval = evaluated at compile time  
