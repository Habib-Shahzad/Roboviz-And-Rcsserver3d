FROM ubuntu:20.04
CMD ["bash"]
ENV DEBIAN_FRONTEND=noninteractive
RUN /bin/sh -c apt-get update && apt install -y build-essential subversion git cmake libfreetype6-dev libsdl1.2-dev ruby ruby-dev libdevil-dev libboost-dev libboost-thread-dev libboost-regex-dev libboost-system-dev -y # buildkit
RUN /bin/sh -c apt install -y git # buildkit
RUN /bin/sh -c apt-get -y install software-properties-common # buildkit
RUN /bin/sh -c apt install -y autogen automake libtool libtbb-dev -y && git clone https://github.com/sgvandijk/ode-tbb.git && cd ode-tbb && ./autogen.sh && ./configure --enable-shared --disable-demos --enable-double-precision --disable-asserts --enable-malloc && make -j8 && make install # buildkit
RUN /bin/sh -c apt-get -y install build-essential && apt-get -y install qtcreator && apt-get -y install qt5-default # buildkit
RUN /bin/sh -c git clone https://gitlab.com/robocup-sim/SimSpark && cd SimSpark/spark && mkdir build && cd build && cmake .. && make -j8 && make install && ldconfig && cd ../../rcssserver3d && mkdir build && cd build && cmake .. && make -j8 && make install && ldconfig # buildkit

EXPOSE 3200
EXPOSE 3100

ENTRYPOINT ["rcssserver3d"]