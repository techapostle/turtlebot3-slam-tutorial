# ROS-melodic-SLAM tutorial


## Environment
* Ubuntu 18.04
* ROS-melodic


## Install packages 
~~~
sudo apt-get install ros-melodic-joy ros-melodic-teleop-twist-joy ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan ros-melodic-rosserial-Arduino ros-melodic-rosserial-python ros-melodic-rosserial-server ros-melodic-rosserial-client ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server ros-melodic-move-base install ros-melodic-urdf ros-melodic-xacro ros-melodic-compressed-image-transport ros-melodic-rqt-image-view ros-melodic-gmapping ros-melodic-navigation
~~~

## Before running the commands below, make sure the ROS packaging dependencies are installed (either through pip/pip3 or apt)
~~~
git clone https://github.com/techapostle/turtlebot3-slam-tutorial.git ~/  
cd ~/lab-challenge-2-3-techapostle && catkin_make  
echo "source ~/lab-challenge-2-3-techapostle/devel/setup.bash >> ~/.bashrc"  
echo "export TURTLEBOT3_MODEL=waffle_pi >> ~/.bashrc"  
~~~


## Driving a Virtual Robot in Gazebo


~~~
roscore  
roslaunchturtlebot3_gazebo turtlebot3_world.launch
~~~

* If you met following error; [Err] [REST.cc:205] Error in REST requestLibcurl: (51) SSL : no alternative certificate subject name matches target host name ‘api.ignitionfu-el.org’

~~~
gedit ~/.ignition/fuel/config.yaml
~~~
* Edit url: https://api.ignitionfuel.org ->url: https://api.ignitionrobotics.org

~~~
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
~~~

~~~
roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch
~~~

## SLAM in GAZEBO
* I recommend quit all previous window including rosecore


* execute Gazebo
~~~
roslaunch turtlebot3_gazebo turtlebot3_world.launch
~~~

* execute SLAM
In this case, we use gmapping that is gemeral slam package
~~~
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
~~~

* execute keypad
~~~
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
~~~
* Map output
~~~
rosrun map_server map_saver -f ./map
~~~


## Navigation in Gazebo
* I recommend quit all previous window including rosecore


* activate Gazebo
~~~
roslaunch turtlebot3_gazebo turtlebot3_world.launch
~~~

~~~
roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/lab-challenge-2-3-techapostle/map.yaml
~~~

