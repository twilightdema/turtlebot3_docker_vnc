FROM tiryoh/ros2-desktop-vnc:foxy

RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until
RUN apt-get -y update

RUN apt-get install -y python3-colcon-common-extensions

RUN apt install -y ros-foxy-gazebo-* ros-foxy-cartographer \
  ros-foxy-cartographer-ros ros-foxy-navigation2 \
  ros-foxy-nav2-bringup python3-vcstool \
  python3-pip

RUN pip3 install cmake

RUN /bin/bash -c "source /opt/ros/foxy/setup.bash"
RUN apt install ros-foxy-dynamixel-sdk
