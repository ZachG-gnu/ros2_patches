#!/bin/bash

function yn_prompt() {
	while true; do
		read -p "$1" yn
		case $yn in
			[Yy]* ) return 0;;
			[Nn]* ) return 1;;
			* ) echo "Please answer yes or no.";;
		esac
	done
}

SCRIPT_PATH=$(realpath $(dirname -- $BASH_SOURCE))

if (! command ros2 &> /dev/null); then
	echo "Could not find ros2. Make sure to source ros2 before running this script."
	return 1
fi

ROS2_DIR=$(which ros2)

# Gets the base directory of ros2
for i in {0..3}; do
	ROS2_DIR=$(dirname $ROS2_DIR) &> /dev/null
done

# Makes sure the src directory exists inside ROS2_DIR
# src directory will only exist when ros2 is built from source
if [ ! -d "$ROS2_DIR/src" ]; then
	echo "Could not find the src directory inside $ROS2_DIR. Make sure ros is built from source."
	return 1
fi

yn_prompt "Found ROS base directory at $ROS2_DIR. Continue with uninstallation (y/n)?" || return 0

RTTEST_DIR="$ROS2_DIR/src/ros2/realtime_support"

git -C $RTTEST_DIR reset --hard > /dev/null

DEMO_DIR="$ROS2_DIR/src/ros2/demos"

git -C $DEMO_DIR reset --hard > /dev/null

cd $ROS2_DIR

colcon build --symlink-install --packages-select rttest pendulum_control pendulum_msgs --allow-overriding rttest pendulum_control pendulum_msgs

cd - > /dev/null

echo "Sucessfully uninstalled patches"
