## CentOS 6.3 vsftp 配置及虚拟用户的配置 ##
### 安装vsftp ###

1. 通过yum来安装vsftpd

	`[root@localhost ~]# yum -y install vsftpd`	//加-y是因为出现提示默认直接按Y。这里yum安装的vsftpd版本应该是2.2.2的。
	
	`[root@localhost ~]# service vsftpd status`	//查看状态，默认是关闭的  
	`[root@localhost ~]# service vsftpd start`	//开启vsftpd服务2.设置为开机启动

	`[root@localhost ~]# chkconfig vsftpd on`  
	`[root@localhost ~]# netstat -tl`			//可以查看ftp端口是否在侦听了!

* 进行相关配置，配置修改在`/etc/vsftpd/vsftpd.conf`里面;

	`[root@localhost ~]# vim /etc/vsftpd/vsftpd.conf` //用vim对代码着色更容易修改。比vi要清楚。自己按照需求进行设置，请看下面的vsftpd.conf的相关配置说明。


* 设置vsftp的帐号。

	普通的添加帐号的话，可以用该帐号登录服务器，使用nologin禁止FTP帐户登录服务器。

	只需要执行命令：

	`[root@localhost ~]# useradd -d /usr/local/apache/htdocs -s /sbin/nologin`		//用户名  添加上帐号指定好ftp帐号的根目录。例如下面的代码，创建ftp帐号ftpuser在网站的根目录htdocs下。

	`[root@localhost ~]# useradd -d /usr/local/apache/htdocs -s /sbin/nologin ftpuser`	//帐号设置好了，但是还没有给帐号加上密码。使用passwd给帐号设置密码。

	`[root@localhost ~]# passwd ftpuser`  
	`New password：`  
	//输入密码   
	`Retype new password：`   
	//再次输入密码   

### vsftpd.conf的相关配置说明 ###
1.  匿名服务器的连接

	Anonymous_enable=yes (允许匿名登陆)
	
	Dirmessage_enable=yes （切换目录时，显示目录下.message的内容）
	
	Local_umask=022 (FTP上本地的文件权限，默认是077)
	
	Connect_form_port_20=yes （启用FTP数据端口的数据连接）*
	
	Xferlog_enable=yes （激活上传和下载的日志）
	
	Xferlog_std_format=yes (使用标准的日志格式)
	
	Ftpd_banner=XXXXX （欢迎信息）
	
	Pam_service_name=vsftpd （验证方式）*
	
	Listen=yes （独立的VSFTPD服务器）*
	
	功能：只能连接FTP服务器，不能上传和下载
	
	注：其中所有和日志欢迎信息相关连的都是可选项,打了星号的无论什么帐户都要添加，是属于FTP的基本选项

 

* 开启匿名FTP服务器上传权限（看看即可，一般不开启匿名上传权限）

	Anon_upload_enable=yes (开放上传权限)
	
	Anon_mkdir_write_enable=yes （可创建目录的同时可以在此目录中上传文件）
	
	Write_enable=yes (开放本地用户写的权限)
	
	Anon_other_write_enable=yes (匿名帐号可以有删除的权限)

 

* 开启匿名服务器下载的权限
	
	在配置文件中添加如下信息即可：
	
	Anon_world_readable_only=no
	
	注：要注意文件夹的属性，匿名帐户是其它（other）用户要开启它的读写执行的权限
	
	（R）读，下载 （W）写，上传 （X）执行。如果不开FTP的目录都进不去

 

* 普通用户FTP服务器的连接
	
	Local_enble=yes （本地帐户能够登陆）
	
	Write_enable=no （本地帐户登陆后无权删除和修改文件）
	
	功能：可以用本地帐户登陆vsftpd服务器，有下载上传的权限
	
	注：在禁止匿名登陆的信息后匿名服务器照样可以登陆但不可以上传下载

 

* 用户登陆限制进其它的目录，只能进它的主目录

	设置所有的本地用户都执行chroot
	
	Chroot_local_user=yes （本地所有帐户都只能在自家目录）
	
	设置指定用户执行chroot
	Chroot_list_enable=yes （文件中的名单可以调用）
	
	Chroot_list_file=/任意指定的路径/vsftpd.chroot_list
	
	注意：vsftpd.chroot_list 是没有创建的需要自己添加，要想控制帐号就直接在文件中加帐号即可

 

* 限制本地用户访问FTP

	Userlist_enable=yes (用userlist来限制用户访问)
	
	Userlist_deny=no (名单中的人不允许访问)
	
	Userlist_file=/指定文件存放的路径/ （文件放置的路径）
	
	注：开启userlist_enable=yes匿名帐号不能登陆


* 安全选项

	Idle_session_timeout=600(秒) （用户会话空闲后10分钟）
	
	Data_connection_timeout=120（秒） （将数据连接空闲2分钟断）
	
	Accept_timeout=60（秒） （将客户端空闲1分钟后断）
	
	Connect_timeout=60（秒） （中断1分钟后又重新连接）
	
	Local_max_rate=50000（bite） （本地用户传输率50K）
	
	Anon_max_rate=30000（bite） （匿名用户传输率30K）
	
	Pasv_min_port=50000 （将客户端的数据连接端口改在
	
	Pasv_max_port=60000 50000—60000之间）
	
	Max_clients=200 （FTP的最大连接数）
	
	Max_per_ip=4 （每IP的最大连接数）
	
	Listen_port=5555 （从5555端口进行数据连接）

 

* 查看谁登陆了FTP,并杀死它的进程

	ps –xf |grep ftp
	
	kill 进程号


### 配置虚拟用户 ###

1. 安装db4-utils
	`[root@localhost ~]#yum install -y db4-utils`

* 关闭selinux 和在iptables开放21端口和30000:30100端口
	`vi /etc/selinux/config` 
	在前面加入一行  
	`SELINUX=disabled`   
	`[root@localhost ~]#vi /etc/sysconfig/iptables` 
	加入:   
	-A INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j ACCEPT   
	-A INPUT -p tcp --dport 30000:30100 -j ACCEPT  
	端口号对应`/etc/vsftpd/vsftpd.conf`中的  
	pasv_enable=YES    
	pasv_max_port=3010  
	pasv_min_port=30000   
	(上面的30000--30100端口号是和iptables中的对应)

* 创建chroot_list将ftp用户加入其中
	`[root@localhost ~]#touch /etc/vsftpd/chroot_list`    
	`[root@localhost ~]#echo ftp >> /etc/vsftpd/chroot_list`    
	然后创建用户密码文本`/etc/vsftpd/virtusers.txt`  
	注意奇行是用户名，偶行是密码      
	user1  
	1234  
	user2  
	1234  
	接着生成虚拟用户认证的db文件    
	`[root@localhost ~]#db_load -T -t hash -f /etc/vsftpd/virtusers.txt  /etc/vsftpd/virtusers.db`  
	随后,编辑认证文件`/etc/pam.d/vsftpd`  
	在前面加上：    
	auth required pam_userdb.so db=/etc/vsftpd/virtusers   
	account required pam_userdb.so db=/etc/vsftpd/virtusers

	看起来像这样：  
	auth sufficient /lib/security/pam_userdb.so db=/etc/vsftpd/virtusers  
	account sufficient /lib/security/pam_userdb.so db=/etc/vsftpd/virtusers  
	session    optional     pam_keyinit.so    force revoke  
	auth       required     pam_listfile.so item=user sense=deny file=/etc/  vsftpd/ftpusers onerr=succeed  
	auth       required     pam_shells.so  
	auth       include      password-auth  
	account    include      password-auth  
	session    required     pam_loginuid.so  
	session    include      password-auth  

	最后创建虚拟用户个性RHEL/CentOS FTP服务文件   
	`[root@localhost ~]#mkdir /etc/vsftpd/vuser_conf/`     
	`[root@localhost ~]#vi /etc/vsftpd/vuser_conf/user1`  
	local_root=/home/ftp/user1 虚拟用户的根目录(根据实际修改)     
	write_enable=YES 可写    
	anon_world_readable_only=NO    
	anon_upload_enable=YES    
	download_enable=YES   
	anon_mkdir_write_enable=YES    
	anon_other_write_enable=YES    
	为目录附权限并重启动vsftp服务:    
	`[root@localhost ~]#mkdir /home/ftp/user1`   
	`[root@localhost ~]#chown ftp:ftp /home/ftp/user1`  
	`[root@localhost ~]#service vsftpd restart`

* 添加新的用户  
	1. `[root@localhost ~]#vi /etc/vsftpd/logins.txt`   加入新用户和密码    
	* `[root@localhost ~]#db_load -T -t hash -f /etc/vsftpd/logins.txt     /etc/vsftpd/vsftpd_login.db`  
	* `[root@localhost ~]#cp /etc/vsftpd/vuser_conf/user1 /etc/vsftpd/vuser_conf/`新用户`[root@localhost ~]#vi /etc/vsftpd/vuser_conf/`新用户设置好对应目录和权限  
	* 用mkdir建立好对应目录如以存在就可以不建立   
	* 用`[root@localhost ~]#chmod -R 777`新目录(或以有的对应目录)(使目录可读写)  
	* 重启vsftpd服务`[root@localhost ~]#service vsftpd restart`    

### 参考 ###

*  百度文库[centos 6.3搭建vsftpd 虚拟用户模式](http://wenku.baidu.com/view/b386f10eeff9aef8941e06bc.html "Title").
*  黑吧安全网[CentOS 6.3安装设置vsftpd](http://www.myhack58.com/Article/sort099/sort0101/2012/35581.htm "Title").
