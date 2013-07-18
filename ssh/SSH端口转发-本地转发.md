# SSH端口转发-本地转发

## 问题描述
1. 假设有四台主机分别为

   ```
   remote-gate : 127.0.1.1  # 远程的ssh服务器, 有个用户rg
   remote-app  : 127.0.1.2  # 远程的某个应用, 假设在9494端口上有个服务
   
   local-gate  : 127.0.0.1  # 本地的ssh服务器, 有个用户lg
   local-box   : 127.0.0.2  # 本地的某台pc机器
   ```
2. remote-app上有个服务在9494端口上提供服务

   ```
   #!/usr/bin/perl
   use Zeta::POE::HTTPD;
   use POE;

   Zeta::POE::HTTPD->spawn( 
       ip       => '127.0.1.2',
       port     => 9494, 
       callback => sub { 'hello world'; },
   );
   $poe_kernel->run();
   exit 0;
   ```
3. 现在local-box这台机器要访问remote-app上的9494这个服务

# 解决方案
1. 在local-gate上执行

   ```
   ssh -CfNg -L 5555:remote-app:9494 rg@remote-gate
   # 解释
   # 1. 将在local-gate上启一个后台进程在5555端口listen
   # 2. 当local-box连接请求到local-gate的5555端口时, 远端的remote-gate将建立到remote-app的连接
   # 3. 看起来好像是local-box直接访问remote-app一样
   ```
2. 图示

   ![local-box---->local-gate:5555===隧道====remote-gate----->remote-app:9494](images/local_proxy.png)
3. 例子
   
   ```
   # 在remote-app上启动9494服务
   ./svc.pl '127.0.1.2' 9494

   # 在local-gate(127.0.0.1)上建立本地转发隧道
   ssh -CfNg -L 5555:127.0.1.2:9494 zhouchao@127.0.1.1

   # 在local-box发起到127.0.0.1:5555访问
   GET 'http://127.0.0.1:5555/' 
   ```

