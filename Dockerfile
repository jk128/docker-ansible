FROM dockerfile/ansible
MAINTAINER SequenceIQ

RUN pip install boto
RUN pip install awscli
RUN pip install apache-libcloud

CMD ["bash"]
