# Docker部署以太坊私有节点（by bootnodes）

基于bootnodes以太坊私有网络节点的部署添加

**TODO** 通过keystore导入账号

## Usage

### genesis.json

复制bootnodes链接所有节点的共同 genesis.json 文件

### Dockerfile

根据需求修改 Dockerfile 中的环境变量

### build image
比如tag为 eth-peer:1.0

```
docker build -t eth-peer:1.0 .
```

### run

```
// docker run -it --rm --name your-name  eth-peer:1.0  /bin/bash


docker run -d --name your-name  eth-peer:1.0
```

## 补充

如果出现以下错误:

```
System clock seems off by -XXXXXs, which can prevent network connectivity
Please enable network time synchronisation in system settings
```

主要是由于该节点r容器的时间和bootnodes服务节点时间不一致，如果bootnodes就是当前节点容器的宿主机，可以在docker run 时加上 `-v /etc/localtime:/etc/localtime:ro`,如果bootnodes服务节点和该节点坊容器不在同一主机，可以通过将两者的时间同一至同一时区的网络时间。
