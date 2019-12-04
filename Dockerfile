FROM centos:7.6.1810

ENV QMAKE=qmake
ENV PATH="${PATH}:/opt/qt/5.5/gcc_64/bin/"
ADD qt-installer-noninteractive.qs .

RUN yum install -y yum-utils && yum groupinstall -y "Development Tools" && yum install -y git wget curl libstdc++-devel make mesa-libGL-devel fontconfig \
  && curl -sSL https://download.qt.io/archive/qt/5.5/5.5.1/qt-opensource-linux-x64-5.5.1.run -o qt.run \
  && chmod +x qt.run \
  && sync \
  && ./qt.run --platform minimal --script qt-installer-noninteractive.qs -v \
  && rm -rf \
    qt.run \
    /var/lib/apt/lists/* \
    /opt/qt/update.rcc \
    /opt/qt/components.xml \
    /opt/qt/InstallationLog.txt \
    /opt/qt/MaintenanceTool* \
    /opt/qt/Tools \
    /opt/qt/Docs \
    /opt/qt/network.xml \
    /opt/qt/Examples

ENTRYPOINT ["/bin/bash"]
