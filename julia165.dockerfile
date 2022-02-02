# test locally for syntax error by running
# docker build -t gridjulia:latest -f julia.dockerfile .

FROM julia:1.6.5

# mandatory for Grid.ai
WORKDIR /gridai/project
COPY . .
