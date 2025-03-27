---
title: "Octaveで配列を用いる際の注意(Tips)"
date: 2025-03-04T15:35:17+09:00
draft: false #true
lang: ja
categories:
  - control
tags: 
  - octave
  - zeros
series:
  - octave
#2023.2.27
---

<!--# Octaveで配列を用いる際の注意(Tips)-->



## かんたん配列に注意

Octaveでは、配列の扱いが簡単になっていますが、落とし穴もたくさんあります。

<!--more-->


例えば以下のソースでtとtiを比較します。

``` matlab:t.m
    time_max=10;
    dt=0.1;
    time_count=time_max/dt;

    t=0:dt:time_max;

    ti=zeros(1,time_count);
    for i=2:time_count;
      ti(i)=ti(i-1)+dt;
    end
```

いずれも、0から10秒まで、0.1秒刻みの数値を設定しています。\
ここで 以下の図を書いてみます。

``` matlab:p.m
    plot(t,sin(ti))
```

結果は?????


```
    error: __plt2vv__: vector lengths must match
    error: called from
        __plt__>__plt2vv__ at line 487 column 5
        __plt__>__plt2__ at line 247 column 14
        __plt__ at line 112 column 18
        plot at line *** column 10
        hairetu_chk at line ** column 1
```

見事エラーです。英語が出て嫌になるかもしれませんが、
めげないで、エラーの原因を探します。\
エラーメッセージの最初に記してあるとおり

```
    vector lengths must match
```

です。

ワークスペースに注目すると、tとtiの次元が1x101と1x100とサイズが一つ異なることがわかります。\
\
つまり、最初のtは0から10まで0.1刻みにあるので、最後の10まで101個のデータがあります。\
しかしtiは0から0.1刻みに100個のデータなので、最後の10はありません。ti(100)=9.9です。\
<font color='red'>特異例ではなく、無意識に計算結果を図示しようとする場合によくおきるので注意しましょう。</font>

## 配列の初期化を明示しよう

Octaveでは、上記のように配列を明示しなくても、勝手に配列として扱ってくれます。\
ただし、これにより、扱っている変数同士を演算に用いるときに思いもかけないエラーに出くわすことがあります。\
たとえば以下のようにすると

``` matlab:s.m
	for i=1:10;
	s(i)=i;
	end

	for i=1:10;
	u(i)=i*2; 
	end

	su=s*u;
```

これもまたエラーになります。

```
	error: operator *: nonconformant arguments (op1 is 1x10, op2 is 1x10)
	error: called from
```

行ベクトル同士の掛け算はできない、という当たり前のことですが、プログラミングしていると「なんで!!!」とパニクる場合があります。\
そこで、配列、ベクトルを演算に用いる場合にパニクらないようにするために、
<font color='red'>配列、ベクトルを用いる場合はzerosを用いて初期化する
習慣をつけましょう。</font>

また、zerosを用いてサイズを明記すると演算速度が上がりますよ、とMatlabでは推奨される場合があります。

上記の場合は

```
	u=zeros(10,1);
```

を加えると、正しく演算できます。

``` matlab:z.m
	for i=1:10;
	s(i)=i;
	end
	
	u=zeros(10,1);
	for i=1:10;
	u(i,1)=i*2; 
	end
	
	su=s*u;
```

uの列方向の引数を省略することも可能ですが、錯覚すると危ないので、明示しましょう。


<font color='red' size='+2' bold>
Octaveでは配列同士の演算が簡単にできる代わりに、要素数や行と列の方向が錯覚しやすいので、
zerosで初期化を行うことをおすすめします。 十分注意して用いましょう。
</font>
