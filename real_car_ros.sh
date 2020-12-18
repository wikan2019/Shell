#!/bin/bash

source ~/catkin_ws/devel/setup.bash

export_car_ros_master(){
	export ROS_MASTER_URI=http://192.168.1.107:11311
}

export_local_ros_master(){
	export ROS_MASTER_URI=http://localhost:11311
}

export_desktop_ros_master(){
	export ROS_MASTER_URI=http://10.10.99.92:11311
}

echo_ROS_MASTER_URI(){
	echo $ROS_MASTER_URI
}

source_catkin_devel(){
	source ~/catkin_ws/devel/setup.bash
}

echo_ROS_IP(){
	echo $ROS_IP
}

set_ROS_IP(){
	export ROS_IP=$1
}

