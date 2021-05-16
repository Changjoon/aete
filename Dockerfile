from ubuntu:18.04
maintainer changjoon.baek@gmail.com

RUN apt update
RUN apt install -y vim curl wget sudo git python3
RUN apt install -y adb=1:7.0.0+r33-2 android-libadb=1:7.0.0+r33-2 \
	android-libbase=1:7.0.0+r33-2 android-liblog=1:7.0.0+r33-2 \
	android-libcutils=1:7.0.0+r33-2

CMD /bin/bash
