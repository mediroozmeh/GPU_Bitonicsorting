
.PHONY = all clean 

CC = scorep-gcc                        # compiler to use

DD = -DDEBUG
CL=-l OpenCL

ifdef oop
OO1= -fselective-scheduling2
OO2= -ffast-math
PP = -DPINNED
oop0= -DOPTIMIZED
endif

LINKERFLAG = -lm

DEPS = extra.h 
PARM = param.h


SRCS := main.c
BINS := main

all: main

main: main.o 
	@echo "Checking.."
	$(CC) -lm main.o -o main $(CL)


main.o: main.c $(DEPS) $(PARM) 
	@echo "Creating object.."
	$(CC) -c -w main.c $(DD) $(PP) $(OO1) $(OO2) $(oop0) 
clean:
	@echo "Cleaning up..."
	rm -rf main.o main output.txt






