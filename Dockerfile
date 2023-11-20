FROM ros:noetic-ros-base

ARG DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

WORKDIR /ros_ws

RUN apt-get update && apt-get install -y \
        git \
        python3-opencv \
        ros-noetic-cv-bridge \
        ros-noetic-image-transport \
        ros-noetic-pcl-conversions \
        ros-noetic-pcl-ros \
        ros-noetic-resource-retriever \
        libtinyxml-dev && \
	apt clean && \
	rm -rf /var/lib/apt/lists/*


RUN mkdir -p src && \
    git clone https://github.com/ros-perception/ar_track_alvar -b noetic-devel src/ar_track_alvar && \
    source /opt/ros/$ROS_DISTRO/setup.bash && \
    catkin_make -DCMAKE_BUILD_TYPE=Release

WORKDIR /ar_tag

COPY ros_entrypoint.sh /