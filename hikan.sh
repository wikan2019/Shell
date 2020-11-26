#!/bin/bash

log_hik(){
	tmuxinator log_hik
}

hikan_log(){
	rosbag record -a -O $1
}
