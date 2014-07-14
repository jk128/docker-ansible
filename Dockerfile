FROM dockerfile/ansible
MAINTAINER SequenceIQ

RUN pip install boto
RUN pip install awscli

CMD ["bash"]
