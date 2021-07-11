from ubuntu:21.04
maintainer changjoon.baek@gmail.com

ENV USER=root
ENV HOME=/${USER}

WORKDIR ${HOME}

RUN yes | unminimize && apt update && apt install -y apt-utils
RUN apt install -y --no-install-recommends tzdata
RUN apt install -y vim curl wget sudo git python3

RUN apt install -y adb android-libadb android-libbase android-liblog android-libcutils

RUN apt update --fix-missing
RUN apt install -y python3.9-dev python3.9-venv python3-setuptools \
            python3-lxml python3-pip libxslt1-dev
RUN apt install -y libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
            libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python3-tk \
            libharfbuzz-dev libfribidi-dev libxcb1-dev

RUN apt install -y language-pack-ko
RUN locale-gen ko_KR.UTF-8
RUN update-locale LANG=ko_KR.UTF-8 LC_MESSAGES=POSIX
RUN locale

RUN apt install -y curl
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN /bin/bash ./get-docker.sh
RUN usermod -aG docker ${USER}

RUN git clone https://github.com/tianxiaogu/ape
COPY ./run_ape_test.sh ${HOME}

RUN git clone https://gitlab.com/changjoon.baek/droidbot.git
WORKDIR ${HOME}/droidbot
RUN apt install -y python3-numpy python3-scipy python3-pandas python3-pandas-lib python3-matplotlib
RUN python3.9 -m pip install wrapt wheel cython
RUN python3.9 -m pip install -e .

WORKDIR ${HOME}
CMD /bin/bash
