FROM python:2-jessie
MAINTAINER piscue@gmail.com
# testing environment to test osc on python

RUN pip install cython
RUN wget http://downloads.sourceforge.net/liblo/liblo-0.29.tar.gz && \
    tar xzf liblo-0.29.tar.gz && cd liblo-0.29 && \
    ./configure && \
    make install && \
    cd .. && rm -R liblo*
RUN pip install pyliblo

# easy debug with vim and netcat
RUN apt-get update && apt-get install -y \
	  vim \
    netcat \
    && \
	  rm -rf /var/lib/apt/lists/*
RUN echo "syntax on" >> /etc/vim/vimrc.local && \
    echo "set bg=dark" >> /etc/vim/vimrc.local

WORKDIR /usr/src/myapp
#CMD ["python", "test.py"]

CMD bash
