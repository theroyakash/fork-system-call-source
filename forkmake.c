/**
 * @file
 * @author [theroyakash](https://www.iamroyakash.com/)
 * @brief Implementation of
 * OS Fork commands
 *
 * @details
 * Implementation of the program  utilizing fork OS system call.
 * Compiled on macOS Big Sur version 11.0 Beta (20A5364e)
 */


#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

void getDetailsIfOperationIsForked(){
    if (fork() == 0){
        printf("\n******* CHILD PROCESS *******\n");
        printf("This Process ID is %d\n", getpid());
        execlp("ls", "ls", "-al", NULL);
        
    }else{
        // wait();
        printf("\n******* PARENT PROCESS *******\n");
        printf("This Process ID %d", getpid());
        printf("Parent process is now terminated thank you.\n\n");
    }
}

int main(){
    getDetailsIfOperationIsForked();
    return 0;
}
