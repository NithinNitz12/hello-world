# Dockerfile
FROM python:3.8-slim
COPY hello_world.py /
CMD ["python", "/hello_world.py"]
