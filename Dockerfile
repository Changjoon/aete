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
RUN git clone https://github.com/tianxiaogu/ape
COPY ./run_ape_test.sh ${HOME}

CMD /bin/bash
