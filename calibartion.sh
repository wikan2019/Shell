#!/bin/bash

start_log(){
      tmuxinator calibration

}

hikan_scan(){
	cd  ~/Projects/saic_pano_calibration/build && ./main 
}

vector_pose_transform(){
	/home/huikang/Projects/SAIC_CALIBRATION_VALI/SAIC_CALIBRATION/build/vector_pose_transmisser --input_json_path $1
}

matrix_2_vector_pose(){
	/home/huikang/Projects/SAIC_CALIBRATION_VALI/SAIC_CALIBRATION/build/matrix2vector_pose --input_json_path $1
}
log_extrinsics_image()
{
	 ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80" &&
	scp -r ~/Projects/SaicCalibration/iecu_demo_anting root@192.168.1.80:/tmp &&
	ssh root@192.168.1.80 " cd /tmp/iecu_demo_anting && ./run.sh"
}

log_extrinsics_image_front_left(){
	# ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80" 
	scp -r ~/Projects/SaicCalibration/iecu_demo_anting_front_left root@192.168.1.80:/tmp &&
	ssh root@192.168.1.80 " cd /tmp/iecu_demo_anting_front_left && ./run.sh"
	mkdir ~/extrinsics/$1
	scp -r root@192.168.1.80:/tmp/sop_cali_img ~/extrinsics/$1 &&
	eog ~/extrinsics/$1/sop_cali_img/front_raw.jpg

}

log_extrinsics_image_high_threshold(){
	# ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80" 
	scp -r ~/Projects/SaicCalibration/iecu_demo_sop_high_threshold root@192.168.1.80:/tmp &&
		ssh root@192.168.1.80 " cd /tmp/iecu_demo_sop_hig_threshold && ./run.sh"
	mkdir ~/extrinsics/$1
	scp -r root@192.168.1.80:/tmp/sop_cali_img ~/extrinsics/$1 &&
	eog ~/extrinsics/$1/sop_cali_img/front_raw.jpg

}

test_anting_extrinsics_image(){
	# ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80" 
	scp -r ~/Projects/SaicCalibration/iecu_demo_anting_front_left root@192.168.1.80:/tmp &&
	ssh root@192.168.1.80 " cd /tmp/iecu_demo_anting_front_left && ./run_test_anting.sh"
	mkdir ~/extrinsics/$1
	scp -r root@192.168.1.80:/tmp/anting_cali_img ~/extrinsics/$1 &&
	eog ~/extrinsics/$1/anting_cali_img/left_raw.jpg

}

copy_extrinsics_images()
{
	# ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80"&&
	mkdir ~/extrinsics/$1
	scp -r root@192.168.1.80:/tmp/sop_cali_img ~/extrinsics/$1 &&
	eog ~/extrinsics/$1/sop_cali_img/front_raw.jpg
}

log_intrinsics()
{
	scp -r ~/saic_calibration/DM_LOGGER/dm_logger_us_960 root@192.168.1.80:/tmp
	ssh root@192.168.1.80 " chmod 777 /tmp/dm_logger_us_960/lib/main "
	ssh root@192.168.1.80 "cd /tmp/dm_logger_us_960 && ./run.sh"
}

log_intrinsics_front_left()
{
	# ssh-keygen -f "~/.ssh/known_hosts" -R "192.168.1.80"&&
	scp -r ~/saic_calibration/DM_LOGGER/dm_logger_us_960_front_left root@192.168.1.80:/tmp
	ssh root@192.168.1.80 "cd /tmp/intrinsics && rm -r cam*"
	ssh root@192.168.1.80 "chmod 777 /tmp/dm_logger_us_960_front_left/lib/main "&&
	ssh root@192.168.1.80 "cd /tmp/dm_logger_us_960_front_left && ./run.sh"
}
copy_intrinsisc_images()
{
	mkdir ~/intrinsics/$1
	scp -r root@192.168.1.80:/tmp/intrinsics ~/intrinsics/$1 &&
	eog ~/intrinsics/$1/intrinscs/cam0
}

start_calibrate()
{
	python3 ~/Projects/AntingCalibrationIntegration/main.py --data_car_sequence $1
}


fuse_json(){
	
	~/Projects/SaicCalibration/laptop/fusion_jsons $1
}

calibrate(){
	~/Projects/SaicCalibration/laptop/calibration_test $1
}

cali_verification_2nd(){
	~/Projects/SAIC_CALIBRATION_VALI/SAIC_CALIBRATION/laptop/cali_verification_2nd $1 $2 $3 a .jpg $4 $5 $6
}
