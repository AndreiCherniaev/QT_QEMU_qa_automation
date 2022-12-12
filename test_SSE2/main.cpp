//Uncoment to test Qt and get "Incompatible processor. This Qt build requires the following features: sse2" on X86 no-SSE2 CPU
//#include <QCoreApplication>
#include <cstdio>

int main(int argc, char *argv[])
{
    
    //Uncoment if you want get information does SSE2 supported by your CPU. I test it.
    //on X86_64 this code says 255
    //on X86 no-SSE2 this code says 0
    
    int count= 0;
    int n= 0;
    if (__builtin_cpu_supports ("sse2")){ //https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/X86-Built-in-Functions.html
         n=255;
    }
    printf("%u", n);
    
    //Uncoment to test Qt and get "Incompatible processor. This Qt build requires the following features: sse2" on X86 no-SSE2 CPU
    /*QCoreApplication a(argc, argv);
    return a.exec();*/
}
