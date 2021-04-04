mkdir -p ~/app/catkin_ws/src
cd ~/app/catkin_ws/src/
git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/app/catkin_ws && catkin_make
echo "source ~/app/catkin_ws/devel/setup.bash" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
