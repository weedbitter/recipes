目录<a href="#" title="系统根据文章中H1到H6标签自动生成文章目录">(?)</a></span><a href="#" onclick="javascript:return openct(this);" title="收起">[-]</a></p><ol style="margin-left: 14px; padding-left: 14px; line-height: 160%;"><li><a href="#t0">如果你喜欢C那你也会爱上Perl</a></li><li><a href="#t1">给C程序员的提示</a></li><ol><li><a href="#t2">变量的类型由它前面的符号确定</a></li><li><a href="#t3">没必要提前声明一个变量</a></li><li><a href="#t4">没有类型转换</a></li><li><a href="#t5">没有字符类型</a></li><li><a href="#t6">不是整除</a></li><li><a href="#t7">再谈数组</a></li><li><a href="#t8">没有switch</a></li><li><a href="#t9">没有struct和union</a></li><li><a href="#t10">没有悬空的else</a></li><li><a href="#t11">不一般的do</a></li><li><a href="#t12">没有内存泄漏</a></li><li><a href="#t13">函数参数</a></li><li><a href="#t14">函数原型</a></li><li><a href="#t15">没有main函数</a></li><li><a href="#t16">不一样的左值</a></li><li><a href="#t17">隐含变量参数</a></li><li><a href="#t18">参考资料</a></li></ol></ol></div><div style="clear:both"></div><div id="article_content" class="article_content">
<div class="tit"><strong><span style="font-size: small;">从C到Perl</span>
</strong>
</div>
<div class="date">2008年11月19日 星期三 23:06</div>
<table style="width: 100%; table-layout: fixed;" border="0">
<tbody>
<tr>
<td>
<div id="blog_text" class="cnt">
<div>作者：王聪 &lt;xiyou.wangcong@gmail.com&gt;</div>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 很多人并不是把Perl当做第一门编程语言来学习的，在学Perl之前往往已经掌握了 
一两门其它语言。虽然有争议，但是我个人认为Perl确实不适合作为入门语言。这篇文章就是写给那些熟悉C而且又想 
掌握Perl的程序员，介绍一些技巧以及如何避免C程序员常犯的错误，带你渡过危险的沼泽。在读这篇文章之前， 
请先查看perltrap的手册页，里面有很多有用的信息，这里不再重复。欢迎来到Perl的魔法世界！</p>
<div><img src="http://www.wangcong.org/images/perl.jpg" alt="" border="0" height="372" width="648">
</div>
<h2><a name="t0"></a>如果你喜欢C，那你也会爱上Perl。</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp; C语言的设计者Dennis Ritche说：“C语言诡异离奇，缺陷重重，却获得了巨大的成功。 
”这大概是因为C的抽象程度碰巧既满足了程序员的要求, 又容易实现。钟爱C的人都乐意写一些稀奇古怪的C程序，并以此展示 
自己的才能。Perl在这方面更可谓是“有过之而无不及”。 Perl丑陋而又抽象，完全可以用来写混乱代码，但它又灵活实用，而且更接近自然语言，也可以用来写诗。 
这本身就很有意思。在C擅长的底层领域，Perl只能望尘莫及，毕竟它天生不是用来和硬件打交道的。 
但在文本处理领域，C只好俯首称臣了，而Perl在这方面非常强大。据说，Perl也得到了很多生物学家的青睐， 在很大程度上帮助了人类基因组计划。谢谢Larry 
Wall！</p>
<h2><a name="t1"></a>给C程序员的提示</h2>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl结合了多种编程语言的特性，C语言也在其中。Perl和C有以下相同之处：<br></p>
<li>1.分号是每个简单语句必需的，换行不能表示语句结束。 
</li>
<li>2.数组下标也是从0开始，Perl中像substr这样的字符串函数也是从0开始计算位置的。 
</li>
<li>3.逗号操作符的作用一样。 
</li>
<li>4.&amp;&amp;和||操作符作用一样。 
<br>
然而，Perl和C毕竟是两种完全不同的编程语言，从C转向Perl有很多值得注意的地方。我们在下面详细讨论。
<h3><a name="t2"></a>1.变量的类型由它前面的符号确定</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 这不是说Perl使用的是匈牙利表示法，而是Perl的特性。 在Perl中，$说明变量是一个scalar，@表明变量是一个array， 
而%说明后面的变量是一个hash。比如：@foo是一个数组，而$foo[0]是数组@foo中第一个元素，@foo[0]是 
一个数组片段，当然也是数组，但这个片段只有一个元素$foo[0]。如果你数组变量把赋给一个标量，比如：$bar=@foo;， 
你将得到的是该数组中元素的个数。</p>
<h3><a name="t3"></a>2.没必要提前声明一个变量</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 在C中你每引入一个变量，都要在前面声明它的类型。在Perl中完全没有必要， 
你可以在任何时候任意引入新的变量。不过，问题就出来了，你可得当心。如果你不小心敲错一个字母，Perl会把它 
当成你新引入的变量，并且自动初始化，有时不会给出任何错误提示，而这显然与你的最初目的不符！所以，最后在每个Perl程序 的前面都加上use 
strict;，确保perl能对代码进行更严格的检查，就像你使用lint检查C程序那样。</p>
<h3><a name="t4"></a>3.没有类型转换</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl中的标量类型范围很广，可以是整数，可以是字符串，也可以是浮点数。 
你可以很安全地把一个整数默默地转化成相应的字符串。Perl解释器能够理解你的意思，不用担心。但是，这并不是说 
任何时候你都可以高枕无忧，把字符串“转化”成整数时，你确实得下一番功夫。我们在下面将会讨论这个问题。</p>
<h3><a name="t5"></a>4.没有字符类型</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl中没有char这种类型。</p>
<blockquote>$ch='c'; 
</blockquote>
上面的语句其实是给标量$ch赋了一个字符串值，因为Perl中单引号也能括起字符串（对比单引号和双引号的不同留做练习）。 
正因如此，才使得把字符串转化成整数或者浮点数变得稍微麻烦了些。我们可以这样这样处理字符：
<blockquote>
<pre>@array = split(//, $string);      # each element a single character @array = unpack("C*", $string);   # each element a code point (number)</pre>
</blockquote>
当然也可以使用正则表达式。Perl中也有类似atoi()的函数，叫作POSIX::strtod，在POSIX模块中，使用前应该先包含它。
<h3><a name="t6"></a>5./不是整除</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 由于Perl中没有整数和浮点数类型的区分，所以当你想按照C的意思用/操作符 
表示整除时，它并非你想要的。实际上/在Perl中是浮点除法，下面的程序是危险的：</p>
<blockquote>
<pre>while($a/=2) { push @tmp, $a % 2; }</pre>
</blockquote>
它会把$a精确地除到小得Perl无法表示它！如果你想表示整除，请将整个表达式放入int函数中。
<h3><a name="t7"></a>6.再谈数组</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 当心：在Perl中只有hash是使用{}初始化的，普通数组array是使用 
()进行初始化的！使用{}给普通数组赋值解释器会报错。而且，Perl中的数组是可以任意伸缩的，不存在数组越界问题。 
不像C，Perl允许有匿名数组/散列/子函数，比如使用匿名数组交换两个变量的值：</p>
<blockquote>($var1, $var2) = ($var2, $var1); 
</blockquote>
Perl数组脱离了底层特性，而且更加灵活方便。
<h3><a name="t8"></a>7.没有switch</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 这实在是让C程序员们吃惊，Perl居然没有switch。的确，Perl并不需要switch 
，因为switch完全可以用if/elsif/else（注意：是elsif而不是else if）或者?:来代替。Perl中的switch可以这样来写：</p>
<blockquote>
<pre>SWITCH: { if ($value == 1) { print "One" }; if ($value == 2) { print "Two" }; if ($value == 3) { print "Three" }; if ($value &gt; 3) { print "Unknown" }; } #Or like this: SWITCH: { $value == 1 and print "One", last; $value == 2 and print "Two", last; $value == 3 and print "Three", last; print "Unknown"; #default }</pre>
</blockquote>
当然你也可以使用goto，毕竟TMTOWTDI（There's 
More Than One Way To Do It.）。
<h3><a name="t9"></a>8.没有struct和union</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 如果你决定使用Perl编程，那么你可以完全绕开struct这类东西。union 
是更为底层的东西，更不应该出现在Perl中。如果你想用struct实现数据结构，比如单链表，那么在Perl 
中你可以选择hash和reference。其实hash可以实现很多数据结构，更详细的内容见《Mastering Algorithms with Perl》一书。 
如果你想用struct实现class，那么你可以使用Perl中的object。最后，如果你说：“我不用struct完成不了这个程序”， 
那你怎么不考虑用C而用Perl呢？</p>
<h3><a name="t10"></a>9.没有悬空的else</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl中的条件和循环语句块都需要用{}括起来，因此也就不存在悬空的else问题。 
记住：块（block）本身就相当于一个只执行一次的循环，因此last对block也起作用。有点例外的情况是当条件判断出现在一条语句的最后时， 
前面没必要加花括号。比如：</p>
<blockquote>
<pre>if $test print "yes";    #This one is WRONG! {print "yse"} if $test;  #WRONG again! print "yes" if $test;    #This one is right.</pre>
</blockquote>
<h3><a name="t11"></a>10.不一般的do</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; do在Perl中被赋予三种不同的含义。当它后面是一个block时，它会把后面 
块中的语句都执行一遍，并且返回最后一个表达式的值；如果它和while或者until连用，Perl会通过测试 
条件来决定执行块中的语句，但是，块中的语句不会被计算在循环之中。所以，使用last/next/redo来控制块是没用的。 
当它后面是一个文件名时，它的作用是把名为此的文件包含进来。当它后面是一个子函数时，它是对后面子函数的调用， 但这是一种不推荐使用的方式。</p>
<h3><a name="t12"></a>11.没有内存泄漏</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 你再也不用担心free和malloc函数造成内存泄漏了，因为在Perl中没有那种函数， 
也没有指针，你几乎不用关心内存分配问题。Perl中类似指针的reference，没有底层的那些特性。实际上，在Perl中造成内存泄漏是很罕见的。你再也不用害怕字符串空间不够用，字符串 
是否以'/0'结尾这种问题了，Perl中的字符串像 C++中的String类一样方便，就是没有C++重载运算符带来的 
连接和比较字符串的实惠（Perl也可以重载运算符，在这里不讨论）。</p>
<h3><a name="t13"></a>12.函数参数</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl被设计成与自然语言很接近的计算机语言，这也就无怪乎用Perl也能写出诗来了。 
函数参数不必都用圆括号括起来。虽然加上圆括号也没什么影响，但是你得知道，不加括号可以让你的程序更易读，更优雅。试比较下面的语句：</p>
<blockquote>open (YOUREYES, $wide) or die ("$!");<br>
open YOUREYES, $wide or die 
$!; </blockquote>
这是Perl，放轻松点儿。 更进一步，如果你不想转递给函数任何参数，不用带多余的圆括号；但是如果你也想同样处理 
你自己写的子函数，你必须在使用之前就定义或者声明那个函数。
<p>&nbsp;&nbsp;&nbsp;&nbsp; 此外，Perl很好地支持可变参数，而且Perl传递函数参数实际上是引用传递，而不是像C那样采用值传递！ 
换句话说，你对@_中的元素进行修改，那么相应的实参也会变化。Perl采用这种方法可以很容易地返回所需要的值。</p>
<h3><a name="t14"></a>13.函数原型</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl中的函数原型是调用环境中的自动模板，而不像C中的那样。而且函数原型只影响那些不带&amp;方式调用的函数。 
你必须十分注意函数原型是否将你的子函数带入了一个新的环境。因此，“最好在新函数中使用函数原型， 
但别在旧函数中使用函数原型。”如果你不小心，你可能因函数原型遇到很多麻烦。但如果你非常谨慎， 你可以用函数原型出色地完成任务。</p>
<h3><a name="t15"></a>14.没有main函数</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; C家族的语言都必须有一个main函数，而Perl不在其中。 
和Basic类似，Perl也没有main函数，自顶向下解释执行。Perl中命令行界面的参数是通过@ARGV数组传递的，而且没有$ARGC变量， 
因为把@ARGV赋给一个标量就能得到参数个数。不过，Perl中的$ARGV[0]相当于C的argv[1]，相当于argv[0] 
的变量是$0。C中环境变量是通过main的参数char** env传递的，而Perl通过%ENV散列。</p>
<h3><a name="t16"></a>15.不一样的左值</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl中所有可能是左值的东西都可以作为左值。比如，如果?:操作符的两部分 
表达式都是左值，那么整个表达式也可以是左值。函数也可以是左值，若substr函数的第一个参数运算后是可修改的， 
它也可以用作左值。你也可以把自己的子函数定义成可以作为左值使用的，是的，Perl允许你这么做。就像这样：</p>
<blockquote>
<pre>my $val; sub canuse : lvalue {  $val;  } canuse() = 9;</pre>
</blockquote>
它可以很安全地把右值赋给$var。
<h3><a name="t17"></a>16.隐含变量/参数</h3>
<p>&nbsp;&nbsp;&nbsp;&nbsp; Perl的一大特点就是它有很多预定义好的变量，它们都有各自专门的用途， 
这和C大不相同。你必须熟悉它们才能驾驭它们。$_可能是最常用的隐含变量了，它是输入和模式匹配中默认的 
变量/参数；@_是用于传递子函数参数的列表；$!保存着最近一次系统调用的错误信息（相当于C中的errno）…… 
还有很多其它。隐含变量虽然看起来有点古怪，但当你熟悉它后，它能给你节省很多时间，增加程序的可读性。</p>
<br>
<p>&nbsp;&nbsp;&nbsp;&nbsp; 当然，Perl的魔力和魅力远不止如此。Perl有着自己独特的风格， 
散发着自己的光芒。你应该用心去寻找Perl中的pearl！愿你也能用Perl创造更多的奇迹，更多的艺术！</p>
<br>
<h3><a name="t18"></a>参考资料：</h3>
</li>
<li>1.《Programming Perl, Third Edition》<br>
&nbsp;&nbsp; Larry Wall, Tom 
Christiansen and Jon Orwant, July 2000, ISBN 0-596-00027-8, 
O'Reilly.<br>
2.《Professional Perl Programming》<br>
&nbsp;&nbsp; Peter Wainwright, 2001, 
ISBN 1-861004-49-4, Wrox Press.<br>
3.《Perl Debugged》<br>
&nbsp;&nbsp; Peter Scott and Ed 
Wright, March 2001, ISBN 0-201-70054-9, Addison Wesley.<br>
4.《The C programming 
Language, Second Edition》<br>
&nbsp;&nbsp; Brian W. Kernighan and Dennis M. Ritchie, 1988, 
ISBN 0-13-110362-8, 
Addison-Wesley.<br>
http://www.wangcong.org/articles/c2perl.html</li>
