v id="article_content" class="article_content" style="margin-top:20px; margin-right:0px; margin-bottom:0px; margin-left:0px; font-family:Arial; font-size:14px; line-height:26px">
<p style="color:rgb(51,51,51); text-align:left">首先 github上的项目是开源的，别人都可以看到，所以你懂的。。。。</p>
<p style="color:rgb(51,51,51); text-align:left"><br>
</p>
<p style="color:rgb(51,51,51); text-align:left">找了几篇关于github的教程，一步一步照葫芦画瓢 下面是两个自我感觉不错的教程，其他的都太墨迹了，食之无味：</p>
<p style="color:rgb(51,51,51); text-align:left"><span style="color:rgb(57,57,57); font-family:verdana,'ms song',Arial,Helvetica,sans-serif; line-height:21px; background-color:rgb(250,247,239)">使用github管理iOS分布式项目开发</span>&nbsp;http://www.cnblogs.com/516inc/archive/2012/03/28/2421492.html
 &nbsp; &nbsp; （比较详细）</p>
 <p style="color:rgb(51,51,51); text-align:left">tit /github 使用方法小记： &nbsp; &nbsp;http://like-eagle.iteye.com/blog/1317009<br>
 <br>
 </p>
 <p style="color:rgb(51,51,51); text-align:left"><br>
 </p>
 <p style="color:rgb(51,51,51); text-align:left">说重点：</p>
 <p style="color:rgb(51,51,51); text-align:left"></p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>1.创建一个新的repository：</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)">先在github上创建并写好相关名字，描述。</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$cd ~/hello-world</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;//到hello-world目录</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git init</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//初始化</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git add .</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //把所有文件加入到索引（不想把所有文件加入，可以用gitignore或add 具体文件)</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git commit</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; //提交到本地仓库，然后会填写更新日志(&nbsp;-m “更新日志”也可)</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git remote add origin git@github.com:WadeLeng/hello-world.git</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;//增加到remote</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git push origin master</span>&nbsp;&nbsp; &nbsp;//push到github上</p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>2.更新项目（新加了文件）：</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$cd ~/hello-world</span></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git add .</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//这样可以自动判断新加了哪些文件，或者手动加入文件名字</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git commit</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//提交到本地仓库</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git push origin master</span>&nbsp;&nbsp; &nbsp;//不是新创建的，不用再add 到remote上了</p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>3.更新项目（没新加文件，只有删除或者修改文件）：</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$cd ~/hello-world</span></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git commit -a</span>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;//记录删除或修改了哪些文件</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git push origin master</span>&nbsp;&nbsp;//提交到github</p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>4.忽略一些文件，比如*.o等:</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$cd ~/hello-world</span></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$vim .gitignore</span>&nbsp;&nbsp; &nbsp; //把文件类型加入到.gitignore中，保存</p>
 <p style="text-align:left; color:rgb(102,102,102)">然后就可以git add . 能自动过滤这种文件</p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>5.clone代码到本地：</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git clone&nbsp;git@github.com:WadeLeng/hello-world.git</span></p>
 <p style="text-align:left; color:rgb(102,102,102)">假如本地已经存在了代码，而仓库里有更新，把更改的合并到本地的项目：</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git fetch origin</span>&nbsp;&nbsp; &nbsp;//获取远程更新</p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git merge origin/master</span>&nbsp;//把更新的内容合并到本地分支</p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>6.撤销</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git reset</span></p>
 <p style="text-align:left; color:rgb(102,102,102)"><strong>7.删除</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)"><span style="background-color:rgb(217,217,217)">$git rm &nbsp;*</span>&nbsp;// 不是用rm</p>
 <p style="text-align:left; color:rgb(102,102,102)">//------------------------------常见错误-----------------------------------</p>
 <p style="text-align:left; color:rgb(102,102,102)">1.<span style="background-color:rgb(217,217,217)">$ git remote add&nbsp;origin git@github.com:WadeLeng/hello-world.git</span></p>
 <p style="text-align:left; color:rgb(102,102,102)"></p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;<strong>错误提示：fatal: remote origin already exists.</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;解决办法：<span style="background-color:rgb(217,217,217)">$ git remote rm origin</span></p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;然后在执行：<span style="background-color:rgb(217,217,217)">$ git remote add origin git@github.com:WadeLeng/hello-world.git</span>&nbsp;就不会报错误了</p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;2.&nbsp;<span style="background-color:rgb(217,217,217)">$ git push origin master</span></p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;<strong>错误提示：error:failed to push som refs to</strong></p>
 <p style="text-align:left; color:rgb(102,102,102)">&nbsp;解决办法：<span style="background-color:rgb(217,217,217)">$ git pull origin master</span>&nbsp;//先把远程服务器github上面的文件拉先来，再push 上去。</p>
 <div style="color:rgb(51,51,51); text-align:left"><br>
 </div>
 <br style="color:rgb(51,51,51); text-align:left">
 <p style="color:rgb(51,51,51); text-align:left">本人遇到的还有一个错误就是，工程传进github 了可是里头缺少文件，</p>
 <p style="color:rgb(51,51,51); text-align:left">解决方法 $git add . &nbsp; &nbsp;(注意一点 &nbsp;。 &nbsp;）表示添加所有文件，</p>
			 <div><br>
			 </div>
			 </div>
