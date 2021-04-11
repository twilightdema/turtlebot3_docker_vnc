# Turtlebot3 Burger Experiments using Docker / VNC

This repository provides dockerfiles and all scripts needed to run Turtlebot3 experiments using both ROS1 and ROS2. All executions are done inside docker containers and GUIs are exposed to user via browser based VNC. So this solution is compatible with every OS (Windows 10 - WSL2, Linux and OSX) given only Docker and Docker Compose are available.

## Installation

### ROS1

Start docker container using the script below:

```bash
cd ros1-kinetic
sudo ./start_ros1.sh
```

### ROS2

Start docker container using the script below:

```bash
cd ros2-dashing
sudo ./start_ros2.sh
```

## First time running

When the container is finished starting, use web browser to access the Ubuntu desktop by navigating to:

```bash
http://localhost:6080
```

Inside Ubuntu desktop, launch terminal (LXTerminal) and execute the one-time setup to download and build all Turtlebot3 packages:

```bash
cd ~/app
./build_tutrtlebot3_packages.sh
exit
```

## Running Experiments with simulation of Turtlebot3 Burger

When the container is finished starting, use web browser to access the Ubuntu desktop by navigating to:

```bash
http://localhost:6080
```

### Simulate map creation using SLAM Algorithm
#### 1) Start Gazebo simulator to simulate Turtlebot3 Burger robot
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./5_run_gazebo_simulator.sh
```
The simulation will be started (It takes a long time in first run).

#### 2) Start Cartographer to create map using SLAM algorithm
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./6_run_map_creation_sim.sh
```
The Cartographer window will be launched. You can see the result from LIDAR sensor of the robot. Next, you will need to command the robot to move around the room so it can create the complete map.

#### 3) Start Telemetry Controller to control robot to move around
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./1_run_keyboard_controller.sh
```
You can now use the key 'w', 'a', 'd', 'x' and 's' to control robot to move around the room. Use it to move the robot until complete map is created.

#### 4) Save to map to map.yaml and map.pgm file
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./3_run_map_export.sh
```
After finished saving, use Ctrl-C to exit and close all terminal windows.

### Perform Autonomous Navigation
#### 1) Start Gazebo simulator to simulate Turtlebot3 Burger robot
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./5_run_gazebo_simulator.sh
```
The simulation will be started (It takes a long time in first run).

#### 2) Start Cartographer to run autonomous navigation
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./7_run_navigation_sim.sh
```
The Cartographer window will be launched. You then need to use "2D Pose Estimation" button and set start position and orientation of the robot. Keep caribrating until the expected environment map of robot seem to be almost perfectly aligned with the real map.

#### 3) Start Telemetry Controller to move robot a little bit to reduce uncertainty
Inside Ubuntu desktop, launch terminal (LXTerminal) and use the script below:
```bash
cd ~/app
./1_run_keyboard_controller.sh
```
You can now use the key 'w', 'a', 'd', 'x' and 's' to control robot. You should use 'a' or 'd' keys to rotate the robot until the caribration produce low uncertainty if robot pose (see the "green" dots for expected possible positions of the robot).

#### 4) Perform autonomous navigation
In Caartographer window, use the "2D Navigation Goal" to set the position and orientation goals of the robot. Afer setting, you can see that the robot will make the movement to achieve the goal using AMCL algorithm.

## License
[MIT](https://choosealicense.com/licenses/mit/)