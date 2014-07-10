FROM dockerfile/ansible
MAINTAINER SequenceIQ

RUN pip install boto

CMD ["bash"]
