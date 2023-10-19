## AWS CLI Installation
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

- check version 
```
[train@localhost ~]$ aws --version

-- output
aws-cli/2.4.0 Python/3.8.8 Linux/3.10.0-1160.36.2.el7.x86_64 exe/x86_64.centos.7 prompt/off
```

## AWS CLI Configuration
```
[train@localhost ~]$ aws configure
AWS Access Key ID [None]: <your_key_id_here>
AWS Secret Access Key [None]: <your_secret_access_key_here>
Default region name [None]: eu-central-1
Default output format [None]:
```

## List IAM users
` aws iam list-users `  


## Syncronization
If you change your user permission from web console your accesskey will change too.
