
FROM python:3.9-slim


RUN apt-get update && apt-get install -y \
    openssl \
    && rm -rf /var/lib/apt/lists/*


RUN useradd -m nonrootuser


RUN mkdir -p /certs


WORKDIR /certs


COPY generate_cert.sh .


USER root
RUN bash generate_cert.sh


USER nonrootuser


EXPOSE 4443


CMD ["python", "app.py"]
