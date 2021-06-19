from ubuntu:18.04
maintainer changjoon.baek@gmail.com

ENV USER=root
ENV HOME=/${USER}

WORKDIR ${HOME}

RUN yes | unminimize && apt update && apt install -y apt-utils
RUN apt install -y vim curl wget sudo git python3 pidcat

RUN apt install -y adb=1:7.0.0+r33-2 android-libadb=1:7.0.0+r33-2 \
	android-libbase=1:7.0.0+r33-2 android-liblog=1:7.0.0+r33-2 \
	android-libcutils=1:7.0.0+r33-2 --allow-downgrades

RUN apt update --fix-missing
RUN apt install -y python3.7 python3.7-dev python3.7-venv python3-setuptools \
    python3-lxml python3-pip libxslt1-dev
RUN apt install -y libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
    libharfbuzz-dev libfribidi-dev libxcb1-dev

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN /bin/bash ./get-docker.sh
RUN usermod -aG docker ${USER}

RUN git clone https://github.com/tianxiaogu/ape
COPY ./run_ape_test.sh ${HOME}

RUN git clone https://github.com/Changjoon/droidbot
WORKDIR ${HOME}/droidbot
RUN python3.7 -m pip install wrapt wheel cython
RUN python3.7 -m pip install numpy scipy
RUN python3.7 -m pip install -e .

WORKDIR ${HOME}
CMD /bin/bash
