# 从卷积到FFT的桥梁---DFT理论



## 问题

**卷积和FFT之间的关系是什么？**

$1+2+3...+99+100=?$

$\frac{n(n+1)}{2}$



## 回顾

**DFT**：离散傅里叶变换，**FFT**：快速傅里叶变换

**卷积**：通常指线性卷积，即 
$$
x_1[n]*x_2[n]=\sum_{k=-\infty}^{+\infty}x_1[k] x_2[n-k]
$$
**DFT**：基于DFT理论，通过循环卷积可以实现线性卷积
$$
x[n]=\frac{1}{N}\sum_{k=0}^{N-1}X[k]W_{N}^{-kn}, \
X[k]=\sum_{n=0}^{N-1}x[n]W_{N}^{kn},\
W_N=e^{-j\frac{2\pi}{N}}
$$
**FFT**：计算循环卷积的快速算法



## 点题

>$x_1[n] = \{1,2,2\}，x_2[n] = \{1,2,3,4\}$，计算：
>
>(1)$x_1[n] * x_2[n];$
>
>(2)6点循环卷积$x_1[n] ⑥ x_2[n].$ 
>
>
>
>(1)线性卷积（翻转、平移、相乘、求和）
>
>由$x_1[n]*x_2[n]=\sum_{k=-\infty}^{+\infty}x_1[k] x_2[n-k]$可得
>
>​	k	-3	-2	-1	0	1	2	3	4	5
>
>***
>
>$x_1[k]$				1	2	2
>
>翻转	4	3	2	1
>
>平移0	4	3	2	1						$y_1$[0]=1
>
>​	1		4	3	2	1					$y_1$[1]=4
>
>​	2			4	3	2	1				$y_1$[2]=9
>
>​	3				4	3	2	1			$y_1$[3]=14
>
>​	4					4	3	2	1		$y_1$[4]=14
>
>​	5						4	3	2	1	$y_1$[5]=8
>
>
>
>(2)循环卷积（周期延拓再卷积）
>
>先补零使$x_1[n], x_2[n]$成为6点序列，$x_1[m]=\{1,2,2,0,0,0\}, x_2[m]=\{1,2,3,4,0,0\}$
>
>再由$x_1[n] ⑥ x_2[n] = \sum_{m=0}^{5}x_1[m]x_2[(n-m) modulo\ 6]$得
>
>​	m		-6	-5	-4	-3	-2	-1	0	1	2	3	4	5	6	7	8	...
>
>***
>
>$x_1[m]$								1	2	2	0	0	0
>
>周期	...	1	2	3	4	0	0	1	2	3	4	0	0	1	2	3	...
>
>翻转	...	1	0	0	4	3	2	1	0	0	4	3	2	1	0	0	...
>
>平移0	...	1	0	0	4	3	2	1	0	0	4	3	2	1	0	0	...	$y_2[0]=1$
>
>​	1	...	2	1	0	0	4	3	2	1	0	0	4	3	2	1	0	...	$y_2[1]=4$
>
>​	2	...	3	2	1	0	0	4	3	2	1	0	0	4	3	2	1	...	$y_2[2]=9$
>
>​	3	...	4	3	2	1	0	0	4	3	2	1	0	0	4	3	2	...	$y_2[3]=14$
>
>​	4	...	0	4	3	2	1	0	0	4	3	2	1	0	0	4	3	...	$y_2[4]=14$
>
>​	5	...	0	0	4	3	2	1	0	0	4	3	2	1	0	0	4	...	$y_2[5]=8$



## 预备知识

**连续时间周期信号的傅里叶级数表示**



**离散时间周期信号的傅里叶级数表示**
$$
x[n]=\sum_{k=<N>}a_ke^{jk\omega_0n}=\sum_{k=<N>}a_ke^{jk(2\pi/N)n}\\
a_k=\frac{1}{N}\sum_{n=<N>}x[n]e^{-jk\omega_0n}=\frac{1}{N}\sum_{n=<N>}x[n]e^{-jk(2\pi/N)n}
$$
**非周期信号的表示：连续时间傅里叶变换**



**非周期信号的表示：离散时间傅里叶变换(DTFT)**
$$
x[n] = \frac{1}{2\pi}\int_{2\pi}X(e^{j \omega})e^{j \omega n}d \omega \\
X(e^{j \omega}) = \sum_{n=-\infty}^{+\infty}x[n]e^{-j \omega n}
$$



## 周期序列的表示：离散时间傅里叶变换(DFS)

对一周期为$N$的周期序列$\widetilde{x}[n]$，形如
$$
\widetilde{x}[n] = \widetilde{x}[n+rN]
$$
它的傅里叶级数表达式($DFS$方程)为
$$
\widetilde{x}[n]=\frac{1}{N}\sum_{k=0}^{N-1}\widetilde{X}[k]W_N^{-kn}
$$
所对应的频谱系数($IDFS$方程)为
$$
\widetilde{X}[k]=\sum_{n=0}^{N-1}\widetilde{x}[n]W_N^{kn}
$$
为了形式上的简洁，记$W_N=e^{-j\frac{2\pi}{N}}$

上述两式就称为一个周期序列的离散傅里叶级数($DFS$)表达式



## 与Z变换的关系

对一有限长序列，长度为$N$，即
$$
x[n]=
\begin{equation}
\left\{
\begin{array}{lr}
非零,0\leqslant n \leqslant N-1 \\
0,其余n
\end{array}
\right.
\end{equation}
$$
它的$Z$变换为
$$
X(Z)=\sum_{n=0}^{N-1}x[n]z^{-n}
$$
现在以周期$N$，周期重复$x[n]$构造一个周期序列$\widetilde{x}[n]$，即
$$
x[n]=
\begin{equation}
\left\{
\begin{array}{lr}
\widetilde{x}[n],0\leqslant n \leqslant N-1 \\
0,其余n
\end{array}
\right.
\end{equation}
$$
由
$$
\widetilde{X}[k]=X(Z)|_{z=e^{j\frac{2\pi}{N}k}}
$$
表明，$DFS \widetilde{X}[k]$代表了$Z$变换$X(Z)$在单位圆上的$N$个等间隔样本。



## 与DTFT的关系

$x[n]$有限，绝对可加，它的$DTFT$存在，
$$
X(e^{j\omega})=\sum_{n=0}^{N-1}x[n]e^{-j\omega n}=\sum_{n=0}^{N-1}\widetilde{x}[n]e^{-j\omega n}
$$
由
$$
\widetilde{X}[k]=X(e^{j\omega})|_{\omega=\frac{2\pi}{N}k}
$$
表明，$DFS \widetilde{X}[k]$ 可以通过以$\omega_0=2\pi/N$ 间隔对$DTFT$ 均匀采样得到。



## 在$Z$域的采样和重建

任意绝对可加序列$x[n]$，可以是无限长，它的$Z$变换给出为
$$
X(z)=\sum_{m=-\infty}^{+\infty}x[m]z^{-m}
$$
假定$X(z)$的收敛域$ROC$包括单位圆。

在单位圆上以$\omega =2\pi/N$的间隔对$X(z)$采样，得到一个$DFS$序列：
$$
\widetilde{X}[k]=X(z)|_{z=e^{j\frac{2\pi}{N}k}}=\sum_{m=-\infty}^{+\infty}x[m]e^{-j\frac{2\pi}{N}km}=\sum_{m=-\infty}^{+\infty}x[m]W_N^{km}, k=0,\pm1,\pm2,...
$$
接下来计算$\widetilde{X}[k]$的$IDFS$，
$$
\widetilde{x}[n]=\frac{1}{N}\sum_{k=0}^{N-1}\widetilde{X}[k]W_N^{-kn}=\frac{1}{N}\sum_{k=0}^{N-1}\Big{(}\sum_{m=-\infty}^{+\infty}x[m]W_N^{km}\Big{)}W_N^{-kn}\\
=\sum_{m=-\infty}^{+\infty}x[m]\frac{1}{N}\sum_{k=0}^{N-1}W_N^{-k(m-n)}=\sum_{m=-\infty}^{+\infty}x[m]\sum_{r=-\infty}^{+\infty}\delta (n-m-rN)\\
=\sum_{r=-\infty}^{+\infty}\sum_{m=-\infty}^{+\infty}x[m]\delta (n-m-rN)=\sum_{r=-\infty}^{+\infty}x[n-rN]
=\cdots+x[n+N]+x[n]+x[n-N]+\cdots
$$
其中用到了恒等式
$$
\frac{1}{N}\sum_{k=0}^{N-1}W_N^{-k(m-n)}=
\begin{equation}
\left\{
\begin{array}
01,n-m=rN\\0,其余n
\end{array}
\right.
\end{equation}
$$
这表示当在单位圆上对$X(z)$采样时在时域得到一个周期序列，这个序列是原序列$x[n]$和它的无穷多个移位$\pm N$整数倍复本的线性组合。由此可见，如果$x[n]=0(n<0和n\geqslant N)$，那么在时域就不存在混叠，因此就有可能从$\widetilde{x}[n]$中恢复出$x[n]$，即
$$
x[n]=\widetilde{x}[n],0\leqslant n \leqslant N-1
$$

### 时域混叠问题

> 设$x_1[n]=\{6,5,4,3,2,1\}$，它的$DTFT$  $X_1(e^{j\omega})$在$\omega_k=\frac{2\pi k}{4},k=0,\pm1,\pm2,\pm3,\cdots$
>
> 被采样得到一个$DFS$ 序列$\widetilde{X}_2[k]$。求$\widetilde{X}_2[k]$的$IDFS$ 序列$\widetilde{x}_2[n]$。
>
> 解：$\widetilde{x}_2[n]=\sum_{r=-\infty}^{+\infty}x_1[n-4r]$
>
> ​	n	...	-4	-3	-2	-1	0	1	2	3	4	5	6	7	8	9	10	11	12	13	...
>
> ***
>
> $r=-2$		2	1
>
> $r=-1$		6	5	4	3	2	1
>
> $r=0$						6	5	4	3	2	1
>
> $r=1$										6	5	4	3	2	1
>
> $r=2$														6	5	4	3	2	1
>
> ***
>
> $\widetilde{x}_2[n]$	...	8	6	4	3	8	6	4	3	8	6	4	3	8	6	4	3	8	6	...
>
> 发现$x[4]$混叠到了$x[0]$，$x[5]$混叠到了$x[1]$。



## 离散傅里叶变换(DFT)

离散傅里叶级数提供了一种数值计算离散时间傅里叶变换的机理，但同时也有时域混叠的潜在问题。前面已经看到，对离散时间傅里叶变换采样就会产生一个周期信号$\widetilde{x}[n]$。可以利用实际问题中的非周期、有限长信号构造出一个周期的信号，使它的主值区间就是这个实际的信号，然后对这个构造出来的周期信号应用$DFS$。这就定义为离散傅里叶变换($DFT$)，其实它就是$DFS$的主值周期。
$$
X[k]=\sum_{n=0}^{N-1}x[n]W_{N}^{kn}, 0\leqslant k\leqslant N-1\\
x[n]=\frac{1}{N}\sum_{k=0}^{N-1}X[k]W_{N}^{-kn}, 0\leqslant n\leqslant N-1\\
$$

##### DFT和IDFT的matlab实现

```matlab
function [Xk]=dft(xn,N)
% Computes Discrete Fourier Transform
% Xk=DFT coeff. array over 0<=k<=N-1
% xn=N-point finite-duration sequence
% N=Length of DFT
n=[0:1:N-1];
k=[0:1:N-1];
WN=exp(-j*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=xn*WNnk;
end
```

```matlab
function [xn]=idft(Xk,N)
% Computes Inverse Discrete Transform
% xn=N-point sequence over 0<=n<=N-1
% Xk=DFT coeff. array over 0<=k<=N-1
% N=Length of DFT
n=[0:1:N-1];
k=[0:1:N-1];
WN=exp(-j*2*pi/N);
nk=n'*k;
WNnk=WN.^(-nk);
xn=(Xk*WNnk)/N;
end
```

### 补零运算

> 分别计算$x[n]=\{1,1,1,1\}$的4点、8点和32点$DFT$。

$$
X(e^{j\omega})=\sum_{n=0}^{3}x[n]e^{-j\omega n}=1+e^{-j\omega}+e^{-j2\omega}+e^{-j3\omega}=\frac{sin(2\omega)}{sin(\omega/2)}e^{-j3\omega/2}
$$

~~~matlab
w=[0:499]*2*pi/500;
magX=abs(sin(2*w)./sin(w/2));
x1=[1,1,1,1];N=4;Xk1=dft(x1,N);magXk1=abs(Xk1);
k1=[0:3];
figure;subplot(3,1,1);plot(w/pi,magX,'--');
hold on;stem(2*pi/N*k1/pi,magXk1);
x2=[1,1,1,1,zeros(1,4)];N=8;Xk2=dft(x2,N);magXk2=abs(Xk2);
k2=[0:7];
subplot(3,1,2);plot(w/pi,magX,'--');
hold on;stem(2*pi/N*k2/pi,magXk2);
x3=[1,1,1,1,zeros(1,28)];N=32;Xk3=dft(x3,N);magXk3=abs(Xk3);
k3=[0:31];
subplot(3,1,3);plot(w/pi,magX,'--');
hold on;stem(2*pi/N*k3/pi,magXk3);
~~~

> 通过补零运算能够增加采样密度，只是增加了频谱的密度，并不能增加频谱的分辨率。

~~~matlab
n=[0:99];
x=cos(0.48*pi*n)+cos(0.52*pi*n);
% 10点序列
n1=[0:9];y1=x(1:10);
figure;subplot(2,1,1);stem(n1,y1);
Y1=dft(y1,10);
magY1=abs(Y1(1:6));
k1=0:5;w1=2*k1/10;
subplot(2,1,2);stem(w1,magY1);
% 补零至100点序列
n2=[0:99];y2=[x(1:10),zeros(1,90)];
figure;subplot(2,1,1);stem(n2,y2);
Y2=dft(y2,100);
magY2=abs(Y2(1:51));
k2=0:50;w2=2*k2/100;
subplot(2,1,2);stem(w2,magY2);
% 原始100点序列
figure;subplot(2,1,1);stem(n,x);
X=dft(x,100);magX=abs(X(1:51));
k=0:50;w=2*k/100;
subplot(2,1,2);stem(w,magX);
~~~



## 利用DFT实现线性卷积

### 序列的循环移位

首先将$x[n]$转换为它的周期延拓$\widetilde{x}[n]$，然后再移动$m$个样本：
$$
\widetilde{x}[n-m]=x[mod(n-m,N)]=x[[n-m]]_N
$$
这称为$\widetilde{x}[n]$的周期移位。最后再将周期移位转换为$N$点序列：
$$
\widetilde{x}[n-m]R_N[n]=x[[n-m]]_NR_N[n]
$$
称为$x[n]$的循环移位。

这里$R_N[n]$定义为一个窗函数，只保留在区间$[0,N-1]$的样本值。

**循环移位的matlab实现**

~~~matlab
function y=cirshftt(x,m,N)
% Method: y[n]=x[mod(n-m,N)]
if length(x)>N
	error('N must be >= the length of x')
end
x=[x,zeros(1,N-length(x))];
n=[0:N-1];
n=mod(n-m,N);
y=x(n+1);
end
~~~



### 循环卷积

包含循环移位的卷积运算称为循环卷积：
$$
x_1[n]\circledast x_2[n]=\sum_{m=0}^{N-1}x_1[m]x_2[[n-m]]_N,0\leqslant n\leqslant N-1
$$
**性质：当两个$N$点的DFT在频域相乘时，在时域就得到循环卷积**
$$
DFT(x_1[n]\circledast x_2[n])=X_1[k]X_2[k]
$$
令$x_1[n]$是$N_1$点序列，$x_2[n]$是$N_2$点序列，它们的线性卷积
$$
x_3[n]=x_1[n]*x_2[n]=\sum_{k=-\infty}^{+\infty}x_1[k] x_2[n-k]=\sum_{k=0}^{N_1-1}x_1[k] x_2[n-k]
$$
是一个$(N_1+N_2-1)$点序列。定义一个$(N_1+N_2-1)$点循环卷积
$$
x_4[n]=x_1[n]\circledast x_2[n]=\Big{(}\sum_{m=0}^{N-1}x_1[m]x_2[[n-m]]_N\Big{)}R_N[n]\\
=\Big{(}\sum_{m=0}^{N-1}x_1[m]\sum_{r=-\infty}^{+\infty}x_2[n-m-rN]\Big{)}R_N[n]\\
=\Big{(}\sum_{r=-\infty}^{+\infty}\sum_{m=0}^{N-1}x_1[m]x_2[n-m-rN]\Big{)}R_N[n]\\
=\Big{(}\sum_{r=-\infty}^{+\infty}x_3(n-rN)\Big{)}R_N[n]
$$
一般来说，循环卷积是线性卷积混叠的结果。现在，因为$x_3[n]$是一个$N=N_1+N_2-1$点序列，而有
$$
x_4[n]=x_3[n], 0\leqslant n\leqslant N-1
$$
即时域不存在混叠现象。

**结论：如果将$x_1[n]$与$x_2[n]$通过补上适当个数的零值而成为$N=N_1+N_2-1$点序列，那么循环卷积就与线性卷积结果一致。**

**循环卷积的matlab实现**

~~~matlab
function y=circonvt(x1,x2,N)
% Circular convolution in the time domain
if length(x1)>N
	error('N must be <= the length of x1')
end
if length(x2)>N
	error('N must be <= the length of x2')
end
x1=[x1,zeros(1,N-length(x1))];
x2=[x2,zeros(1,N-length(x2))];
m=[0:N-1];
x2=x2(mod(-m,N)+1);
H=zeros(N,N);
for n=1:N
	H(n,:)=cirshftt(x2,n-1,N);
end
y=x1*conj(H');
end
~~~

**线性卷积conv()与循环卷积circonvt()的结果对比**

~~~matlab
x1=[1,2,2];x2=[1,2,3,4];
y=conv(x1,x2)
y=circonvt(x1,x2,4)
y=circonvt(x1,x2,5)
y=circonvt(x1,x2,6)
y=circonvt(x1,x2,7)
~~~



## 快速傅里叶变换

利用因子$W_N^{nk}$的周期性
$$
W_N^{nk}=W_N^{k(n+N)}=W_N^{(k+N)n}
$$
和对称性
$$
W_N^{kn+N/2}=-W_N^{kn}
$$

### 按时间抽取的FFT(DIT-FFT)算法

令$N=2^\nu$，将$x[n]$分为两个$N/2$点序列：
$$
g_1[n]=x[2n];g_2[n]=x[2n+1],0\leqslant n\leqslant \frac{N}{2}-1
$$
序列$g_1[n]$包括$x[n]$的偶数样本，序列$g_2[n]$则包括$x[n]$的奇数数样本，
$$
X[k]=G_1[k]+W_N^kG_2[k],0\leqslant k\leqslant N-1
$$
上式将两个$N/2$点的$DFT$合并为一个$N$点的$DFT$。

重复这个过程，在每一步都对序列进行抽取，并且较小的$DFT$都被合并。

(更详细的$FFT$算法将在另外的视频中描述)



## 快速卷积

**快速卷积算法：应用循环卷积实现线性卷积，并应用$FFT$实现循环卷积**

具体而言就是，线性卷积$x_1[n]*x_2[n]$能用两个$N$点的$FFT$，一个$N$点的点乘和一个$N$点的$IFFT$来实现：
$$
x_1[n]*x_2[n]=IFFT\Big{[}FFT[x_1[n]]FFT[x_2[n]]\Big{]}
$$



## 参考

![](从卷积到DFT和FFT.assets/信号与系统.jpg)

![](从卷积到DFT和FFT.assets/离散时间信号处理.jpg)

![](从卷积到DFT和FFT.assets/数字信号处理(MATLAB版).jpg)