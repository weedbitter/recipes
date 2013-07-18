# SSH隧道

## SSH的三个强大的端口转发命令：
1. [本地转发](SSH端口转发-本地转发.md)

   ```
   ssh -C -f -N -g -L listen_port:DST_Host:DST_port user@Tunnel_Host
   ```
2. [远程转发](SSH端口转发-远程转发.md)

   ```
   ssh -C -f -N -g -R listen_port:DST_Host:DST_port user@Tunnel_Host
   ```
3. [动态转发](SSH端口转发-动态转发.md)

   ```
   ssh -C -f -N -g -D listen_port user@Tunnel_Host
   ```

## 参数解释
* `-f` 

  Fork into background after authentication.
  后台认证用户/密码，通常和-N连用，不用登录到远程主机。

* `-p port` 

  Connect to this port. Server must be on the same port
  被登录的ssd服务器的sshd服务端口。

* `-L port:host:hostport`
  
  将本地机(客户机)的某个端口转发到远端指定机器的指定端口. 工作原理是这样的, 本地机器上分配了一个 socket 侦听 port 端口, 一旦这个端口上有了连接, 该连接就经过安全通道转发出去, 同时远程主机和 host 的 hostport 端口建立连接. 可以在配置文件中指定端口的转发. 只有 root 才能转发特权端口. IPv6 地址用另一种格式说明: port/host/hostport

* `-R port:host:hostport`
  
  将远程主机(服务器)的某个端口转发到本地端指定机器的指定端口. 工作原理是这样的, 远程主机上分配了一个 socket 侦听 port 端口, 一旦这个端口上有了连接, 该连接就经过安全通道转向出去, 同时本地主机和 host 的 hostport 端口建立连接. 可以在配置文件中指定端口的转发. 只有用 root 登录远程主机才能转发特权端口. IPv6 地址用另一种格式说明: port/host/hostport

* `-D port`
  
  指定一个本地机器"动态的"应用程序端口转发. 工作原理是这样的, 本地机器上分配了一个 socket 侦听 port 端口, 一旦这个端口上有了连接, 该连接就经过安全通道转发出去, 根据应用程序的协议可以判断出远程主机将和哪里连接. 目前支持 SOCKS4 协议, 将充当 SOCKS4 服务器. 只有 root 才能转发特权端口. 可以在配置文件中指定动态端口的转发.

* `-C`
  
  Enable compression.
  压缩数据传输。

* `-N` 

  Do not execute a shell or command.
  不执行脚本或命令，通常与-f连用。

* `-g` 

  Allow remote hosts to connect to forwarded ports.
  在-L/-R/-D参数中，允许远程主机连接到建立的转发的端口，如果不加这个参数，只允许本地主机建立连接。

