# interrobangc/awscli

This docker image sets up awscli

## Basic usage

To get a bash prompt on an awscli container

```
docker run -it --rm interrobangc/awscli
```

To run a command on an awscli container

```
docker run -it --rm interrobangc/awscli aws s3 ls
```

To run a command on an awscli container with your AWS credentials in ENV

```
docker run -it --rm -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY interrobangc/awscli aws s3 ls
```

To run a command on an awscli container with your AWS credentials in a config file

```
docker run -it --rm -v ~/.aws:/home/aws/.aws interrobangc/awscli aws s3 ls
```
