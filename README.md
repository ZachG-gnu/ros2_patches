# ROS2 Patches
When running the pendulum demo, it can be observed that the latency of the first iteration is much higher than the rest of the iterations. This outlier is caused by the demo not yet loaded into cache. In some cases, the initial cache misses of a program when it first starts up can be ignored. this patches the pendulum demo to add the capability for clearing the current statistics while the demo is running. In addition, the patch also improves the initial performance of the pendulum demo when it first starts up.

## Requirements
NOTE: This patch has only been tested on Ubuntu 20.04. Your mileage may vary for other distros.
* ROS2 Humble built from source. For installation instructions for building from source visit: https://docs.ros.org/en/humble/Installation/Alternatives/Ubuntu-Development-Setup.html
* Git installed
* Linux machine

## Installation
This patch can only be installed on ROS2 versions built from source. Visit the ROS 2 documentation for instructions on building ROS 2 Humble from source.

First make sure ROS 2 is sourced. Replace path-to-ros2 with your system's path to ros2:
```bash
source path-to-ros2/install/local_setup.bash
```

Download this repo:
```bash
cd ~
git clone https://github.com/ZachG-gnu/ros2_patches.git
```

Run the install script:
```bash
cd ros2_patches
. install.sh
```

## Usage
To clear the current runnning statistics, execute the following command in a new terminal with ROS 2 sourced:
```bash
pendulum_teleop -c
```

To display the help screen:
```bash
pendulum_teleop -h
```

## Example
With ROS2 sourced, run the pendulum demo for an infinite amount of time:
```bash
pendulum_demo -i 0
```

In a new terminal with ROS 2 sourced, run the following command to start the logger:
```bash
pendulum_logger
```

In another new terminal with ROS 2 sourced, run the following command to clear the current statistics:
```bash
pendulum_teleop -c
```

You should then observe that the statistics shown on the pendulum logger are cleared.

## Uninstall
To uninstall this patch you can run the provided uninstall script:
```bash
cd ~/ros2_patches
. uninstall.sh
```
