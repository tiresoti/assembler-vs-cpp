# assembler-vs-cpp

"A program written in assembler is faster and smaller than any other one".
Have you heard this before? Surely you did, and so did I.
"This is gibberish! Modern compilers optimize code so well that there's no difference at all" - that's what I was also told.

Well, who is right? I think the best way to find out is to try it yourself. So I've written a small program in Flat Assembler for x86 architecture, then I've coded another program with the same logic and similar structure on C++. Both programs sort a 10 4-byte numbers array using simple bubble sort and print the result in console output. I've built both sources on my Debian laptop with a 32-bit Intel processor using fasm and gcc respectively.

And you know what? The assembler binary takes 307 bytes, while C++ executable is 5.4 kB! Soooo...that's not a myth? I don't know, I'm new to programming. But it was fun to try out!

Here you can find source codes and a Linux ELF-32 executable. A C++ binary will be attached later when I copy it from my old laptop. Also the .asm source is intensively commented because the assembler code is tough to read, I tried to simplify understanding it.
