#!/bin/bash
scp -P 50108 -r $1  xiaoxiangcao@221.216.6.114:~/$2
ssh -p 50108 xiaoxiangcao@221.216.6.114 " echo Zheteng108 | sudo -S mv ~/$2 $3 "
