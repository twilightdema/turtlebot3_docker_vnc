FROM osrf/ros:foxy-desktop

RUN echo "Acquire::Check-Valid-Until \"false\";\nAcquire::Check-Date \"false\";" | cat > /etc/apt/apt.conf.d/10no--check-valid-until

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt-get upgrade -y

RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV USER ubuntu

RUN apt-get install -y python3-colcon-common-extensions

RUN apt install -y ros-foxy-gazebo-* ros-foxy-cartographer \
  ros-foxy-cartographer-ros ros-foxy-navigation2 \
  ros-foxy-nav2-bringup python3-vcstool \
  python3-pip

RUN pip3 install cmake

RUN /bin/bash -c "source /opt/ros/foxy/setup.bash"

# Install LXDE Desktop
RUN apt install ros-foxy-dynamixel-sdk
RUN apt-get install -y --no-install-recommends \
      policykit-1-gnome && apt install -y --no-install-recommends dbus-x11 \
      lxde \
      lxlauncher \
      lxmenu-data \
      lxtask \
      procps \
      psmisc
# GTK 2 and 3 settings for icons and style, wallpaper
RUN echo '\n\
    gtk-theme-name="Raleigh"\n\
    gtk-icon-theme-name="nuoveXT2"\n\
    ' > /etc/skel/.gtkrc-2.0 && \
    \
    mkdir -p /etc/skel/.config/gtk-3.0 && \
    echo '\n\
    [Settings]\n\
    gtk-theme-name="Raleigh"\n\
    gtk-icon-theme-name="nuoveXT2"\n\
    ' > /etc/skel/.config/gtk-3.0/settings.ini && \
    \
    mkdir -p /etc/skel/.config/pcmanfm/LXDE && \
    echo '\n\
    [*]\n\
    wallpaper_mode=stretch\n\
    wallpaper_common=1\n\
    wallpaper=/usr/share/lxde/wallpapers/lxde_blue.jpg\n\
    ' > /etc/skel/.config/pcmanfm/LXDE/desktop-items-0.conf && \
    \
    mkdir -p /etc/skel/.config/libfm && \
    echo '\n\
    [config]\n\
    quick_exec=1\n\
    terminal=lxterminal\n\
    ' > /etc/skel/.config/libfm/libfm.conf && \
    \
    mkdir -p /etc/skel/.config/openbox/ && \
    echo '<?xml version="1.0" encoding="UTF-8"?>\n\
    <theme>\n\
    <name>Clearlooks</name>\n\
    </theme>\n\
    ' > /etc/skel/.config/openbox/lxde-rc.xml && \
    \
    mkdir -p /etc/skel/.config/ && \
    echo '[Added Associations]\n\
    text/plain=mousepad.desktop;\n\
    ' > /etc/skel/.config/mimeapps.list

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
