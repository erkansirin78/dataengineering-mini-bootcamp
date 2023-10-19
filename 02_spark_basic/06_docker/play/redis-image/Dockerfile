# Use an existing image as base image
FROM centos:7

# Donwload and install a dependency
RUN yum install epel-release -y && \
    yum update -y && \
    yum install redis -y && \
    yum clean all


# Tell the image what to do when it starts as container
CMD ["/usr/bin/redis-server"]