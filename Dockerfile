FROM python:3.11-alpine
RUN adduser -D flask
USER flask
WORKDIR /home/flask
ENV PATH="/home/flask/.local/bin:${PATH}"
COPY --chown=flask:flask requirements.txt requirements.txt
RUN pip install --user -r requirements.txt
COPY --chown=flask:flask . .
EXPOSE 5000
CMD ["python", "app.py"]
