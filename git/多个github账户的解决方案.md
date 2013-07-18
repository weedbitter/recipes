# 多个github账户的解决方案

## 问题描述

1. 你有两个github用户分别为: haryzhou, harygithub
2. 你希望在本地一个用户下同时使用这个两个github用户

## 解决方案
1. 产生harygithub的公私钥对

   ```
   gardenia:github zhouchao$ ssh-keygen -i ~/.ssh/hg
   ```
2. 产生haryzhou的公私钥对

   ```
   gardenia:github zhouchao$ ssh-keygen
   ```
3. 编辑~/.ssh/config文件

   ```
   host hg
       user git
       hostname github.com
       port 22
       PreferredAuthentications publickey
       identityfile ~/.ssh/hg
   hary hary
       user git
       hostname github.com
       port 22
       PreferredAuthentications publickey
       identityfile ~/.ssh/id_rsa
   ```
4. 将~/.ssh/hg.pub配置到你harygithub账户中
5. 将~/.ssh/id_rsa.pub配置到你haryzhou账户中
6. hg在harygithub中生效 
  
   ```
   gardenia:github zhouchao$ ssh -T hg
   ```
7. hary在haryzhou中生效

   ```
   gardenia:github zhouchao$ ssh -T hary
   ```
8. 开始使用

   ```
   # 以harygithub访问
   gardenia:github zhouchao$ git clone hg:harygithub/zdemo.git
   # 以haryzhou访问
   gardenia:github zhouchao$ git clone hary:haryzhou/recipes.git
   ```

