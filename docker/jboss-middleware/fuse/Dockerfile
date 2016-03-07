FROM kameshsampath/ansible

MAINTAINER "Kamesh Sampath<kamesh.sampath@hotmail.com>"

LABEL Description="A RedHat Fuse 6.2.1 container" Vendor="Kamesh Sampath" \ fuse-version="6.2.1.redhat-084"  maven-version="3.3.9" java-version="openjdk-1.7.0" \ ansible-version="2.0.1" Version="1.0"

ENV JAVA_HOME /usr
ENV KARAF_HOME /var/jboss-fuse-6.2.1.redhat-084
ENV KARAF_BASE $KARAF_HOME
ENV KARAF_DATA $KARAF_BASE/data
ENV NODE_NAME node1

WORKDIR /srv/ansible

# Start Fuse Install
RUN ansible-playbook fuse.yml  -c local  && \
pip freeze | xargs pip uninstall -y && \
yum -y remove deltarpm epel-release gcc python-devel git python-setuptools && \
rm -rf /srv/ansible && \
rm -rf $KARAF_HOME/quickstarts && \
rm -rf $HOME/.ansible && \
mkdir -p $KARAF_DATA/log && \
ln -sf /dev/stdout $KARAF_DATA/log/fuse.log

## TODO fix this
VOLUME $KARAF_HOME

WORKDIR $KARAF_HOME

EXPOSE 22 8181 2181 8182

CMD ["bin/start"]