FROM centos:7
MAINTAINER Jeff Mclean <jeffrey.mclean@viasat.com>

ENV INSTALLHOST="https://artifactory.viasat.com/artifactory/maas-generic-local" OBJECTSERVER_PRIMARY_NAME="NCOMS" OBJECTSERVER_PRIMARY_PORT="4100" OBJECTSERVER_USER="root" OBJECTSERVER_PASSWORD="" CONFIGS_HOME="/opt/viasat/omnibus/configs/webgui" 

#################################
# Possible WebGui build variables
#################################
#OBJECTSERVER_PRIMARY_HOST: dev-omni-objsrv01 
#OBJECTSERVER_PRIMARY_HOST: 10.69.20.155
#OBJECTSERVER_PRIMARY_PORT: 4100
#OBJECTSERVER_PRIMARY_NAME: NCOMS 
#OBJECTSERVER_SECONDARY_HOST:
#OBJECTSERVER_SECONDARY_PORT:
#OBJECTSERVER_SECONDARY_NAME:
#OBJECTSERVER_USER: root
#OBJECTSERVER_PASSWORD: ""
#OBJECTSERVER_FAILOVER:
#OBJECTSERVER_ENCRYPTED:
#OBJECTSERVER_ALGORITHM_ATTRIBUTE:
#OBJECTSERVER_SSL:


# Add dependencies
RUN yum --setopt=tsflags=nodocs -y install \
    tar \
    hostname \
    unzip \
    audit-libs \
    fontconfig \
    freetype \
    compat-libstdc++-33.i686 \
    glibc.i686 \
    gtk2 \
    libICE \
    libSM \
    libX11 \
    libXau \
    libXcursor \
    libXext \
    libXft \
    libXmu \
    libXp \
    libXpm \
    libXrender \
    libXt \
    libXtst \
    libstdc++.i686 \
    libgcc.i686 \
    libjpeg-turbo \
    libpng12 \
    motif \
    dejavu-fonts-common \
    dejavu-sans-fonts \
    expat \
    glibc \
    libgcc \
    libidn \
    libstdc++ \
    libuuid \
    libxcb \
    nss-softokn-freebl \
    pam \
    zlib \
    nss-softokn-freebl.i686 \
    compat-libstdc++-33 && \
    rm -rf /var/cache/yum/* && \
    yum clean all

# Add installation media
COPY webgui-response.xml run_jazzsm.sh /tmp/install/scripts/

# Add dedicated user
RUN mkdir -p /opt/IBM /tmp/install/was /tmp/install/jazz /tmp/install/webgui /tmp/install/im && \
    #useradd -c "Netcool user" netcool && chown -R netcool:netcool /tmp/install /opt/IBM && \
    chown -R root:root /tmp/install /opt/IBM && \
    mv /tmp/install/scripts/run_jazzsm.sh /

#RUN chown -R netcool:netcool /tmp/install /opt/IBM

#USER netcool

RUN cd /tmp/install && \
    curl -O $INSTALLHOST/agent.installer.linux.gtk.x86_64_1.8.4000.20151125_0201.zip -u 'nms_exede_ci-cd:AKCp2UNConPgDX6sZnkAoRQ1N8Qevm71RrHsTg86kEuC2BaYyeZfrhuRJX6StuSjUgaPNk5Hf' && unzip -q -d /tmp/install/im agent.installer.linux.gtk.x86_64_1.8.4000.20151125_0201.zip && \
    curl -O $INSTALLHOST/IBM_WAS_FOR_JSM_FOR_LNX_ML.zip -u 'nms_exede_ci-cd:AKCp2UNConPgDX6sZnkAoRQ1N8Qevm71RrHsTg86kEuC2BaYyeZfrhuRJX6StuSjUgaPNk5Hf' && unzip -q -d /tmp/install/was IBM_WAS_FOR_JSM_FOR_LNX_ML.zip && \
    curl -O $INSTALLHOST/JAZZ_FOR_SM_1.1.2.1_FOR_LNX.zip -u 'nms_exede_ci-cd:AKCp2UNConPgDX6sZnkAoRQ1N8Qevm71RrHsTg86kEuC2BaYyeZfrhuRJX6StuSjUgaPNk5Hf' && unzip -q -d /tmp/install/jazz JAZZ_FOR_SM_1.1.2.1_FOR_LNX.zip && \
    curl -O $INSTALLHOST/OMNIBUS-V8.1.0.4-WebGUI.linux64.zip -u 'nms_exede_ci-cd:AKCp2UNConPgDX6sZnkAoRQ1N8Qevm71RrHsTg86kEuC2BaYyeZfrhuRJX6StuSjUgaPNk5Hf' && unzip -q -d /tmp/install/webgui OMNIBUS-V8.1.0.4-WebGUI.linux64.zip && \
    cd /tmp/install && rm -f agent.installer.linux.gtk.x86_64_1.8.4000.20151125_0201.zip IBM_WAS_FOR_JSM_FOR_LNX_ML.zip JAZZ_FOR_SM_1.1.2.1_FOR_LNX.zip OMNIBUS-V8.1.0.4-WebGUI.linux64.zip && \
    /tmp/install/im/userinstc --launcher.ini /tmp/install/im/user-silent-install.ini -acceptLicense && \
    /root/IBM/InstallationManager/eclipse/tools/imcl -input /tmp/install/scripts/webgui-response.xml -silent -nosplash -acceptlicense -ShowVerboseProgress -log /root/install.log && \
    /opt/IBM/JazzSM/profile/bin/startServer.sh server1 -script /opt/IBM/JazzSM/profile/bin/startJazz.sh && \
    chmod +x /run_jazzsm.sh && rm -rf /tmp/install && rm -rf /root/IBM

EXPOSE 16311 16312 16313 16314 16315 16316 16320 16321 16322 16323 

CMD /run_jazzsm.sh
