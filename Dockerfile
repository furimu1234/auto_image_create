FROM python:3.10
USER root

RUN apt-get update && \
    apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

RUN apt-get install less

WORKDIR /project

COPY ./main.py /project
COPY ./cogs/ /project/cogs
COPY ./.env /project
COPY ./requirements.txt /project
COPY ./imgs /project

RUN pip install -r requirements.txt --extra-index-url https://www.piwheels.org/simple

CMD ["python", "main.py"]