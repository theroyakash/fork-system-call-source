#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

void getDetailsIfOperationIsForked(){
    if (fork() == 0){
        printf("\n******* CHILD PROCESS *******\n");
        printf("This Process ID is %d and Parent ID is %d", getpid(), getppid());
        printf("Parent task waits until your child is terminated.\nTo terminate the child task enter a number:\n");
        int n;
        scanf("%d", &n);
        printf("You gave me a number which is %d\n Your child process is now terminated, now its time for the parent process\n\n", n);
        
    }else{
        //wait();
        printf("\n******* PARENT PROCESS *******\n");
        printf("This Process ID %d", getpid());
        printf("Parent process is now terminated thank you.\n\n");
    }
}

int main(){
    getDetailsIfOperationIsForked();
    return 0;
}
