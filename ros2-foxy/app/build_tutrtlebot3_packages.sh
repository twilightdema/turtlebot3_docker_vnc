mkdir -p ~/app/turtlebot3_ws/src
cd ~/app/turtlebot3_ws/src/
source /opt/ros/foxy/setup.bash
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/app/turtlebot3_ws && colcon build --symlink-install
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
echo "source ~/app/turtlebot3_ws/install/setup.bash" >> ~/.bashrc
echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
