ARG ROS_DISTRO=humble

FROM osrf/ros:$ROS_DISTRO-desktop

ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp

RUN apt update && \
        apt install -y \
        ros-$ROS_DISTRO-xacro \
        ros-$ROS_DISTRO-joint-state-publisher \
        ros-$ROS_DISTRO-gazebo-ros-pkgs \
        ros-$ROS_DISTRO-rqt-robot-steering \
        ros-$ROS_DISTRO-rmw-fastrtps-cpp \
        # ros-$ROS_DISTRO-navigation2 \
        # ros-$ROS_DISTRO-nav2-bringup && \
    &&\
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc

