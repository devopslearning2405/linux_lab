#!/bin/bash
export LC_ALL=en_US.UTF-8
echo -e "\n==================================`date`=================================="

## Checking %CPU, %MEM, MEM
echo "%CPU   %MEM   MEM   PROCESS" && ps aux | awk '{mem[$11]+=int($6/1024)}; {cpuper[$11]+=$3};{memper[$11]+=$4}; END {for (i in mem) {print cpuper[i]"% ",memper[i]"% ",mem[i]" MB ",i}}' | grep awsagent

## Chekcing IOwait
echo -e "\nTIME        UID      PID      kB_rd/s      kB_wr/s      kB_ccwr/s  PROCESS" && pidstat -dl | grep awsagent

## Checking network
echo -e "\nProto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name" && netstat -p tcp | grep awsagent
