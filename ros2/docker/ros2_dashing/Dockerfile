FROM tiryoh/ros2-desktop-vnc

RUN apt-get -y update

RUN apt-get install -y python3-colcon-common-extensions

RUN apt install -y gazebo9 libgazebo9-dev \
  ros-dashing-gazebo-ros-pkgs ros-dashing-cartographer \
  ros-dashing-cartographer-ros ros-dashing-navigation2 \
  ros-dashing-nav2-bringup python3-vcstool 


RUN /bin/bash -c "source /opt/ros/dashing/setup.bash"
RUN apt install ros-dashing-dynamixel-sdk
