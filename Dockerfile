FROM       ubuntu
MAINTAINER Russell Smith "russ@rainforestqa.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main restricted universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential ruby1.9.3 supervisor

RUN mkdir -p /var/log/supervisor /root/recall

# Copy supervisord config
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install ruby app
ADD . /root/recall
WORKDIR /root/recall
RUN gem install bundler
RUN bundle

CMD ["/usr/bin/supervisord", "-n"]