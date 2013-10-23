#include    <stdio.h>
#include    <stdlib.h>
#include    <echo_control_mobile.h>

int main(void){
    void *aecInst;
    if(-1 == WebRtcAecm_Create(&aecInst)){
        perror("WebRtcAec_Create:");
        exit(1);
    }
    if(-1 == WebRtcAecm_Init(aecInst,8000)){
        perror("WebRtcAec_Init:");
        exit(1);
    }
    WebRtcAecm_Free(aecInst);

    printf("hello webRTC\n");
    return 0;
}
