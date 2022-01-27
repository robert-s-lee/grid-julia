# test locally for syntax error by running
# `docker build -t gridray:latest -f gridray.dockerfile .`

FROM julia:1.7

# mandatory for Grid.ai
WORKDIR /gridai/project
COPY . .
