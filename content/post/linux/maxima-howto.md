---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "maximaおぼえがき" # Title of the blog post.
date: 2025-03-04T15:46:46+09:00 # Date of post creation.
description: "maxima つかいかた" # Description used for search engine.
featured: false #true # sidebarのおすすめの投稿, sets if post is a featured post, making appear on the home page side bar.
draft: false #true # Sets whether to render this page. Draft of true will not be rendered.
toc: false # Controls if a table of contents should be generated for first-level links automatically.
# menu: main # when uncomment, display on manu bar
usePageBundles: false # Set to true to group assets like images in the same folder as this post.
#featureImage: "/images/path/file.jpg" # Sets featured image on blog post.
#featureImageAlt: 'Description of image' # Alternative text for featured image.
#featureImageCap: 'This is the featured image.' # Caption (optional).
#thumbnailはstatic/images/*.pngを
#thumbnail: "/images/path/thumbnail.png" # Sets thumbnail image appearing inside card on homepage.
#shareImage: "/images/path/share.png" # Designate a separate image for social media sharing.
codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.
# hugo.tomlのtaxonomiesで分類あり
categories:
  - tool
tags:
  - maxima
#series :
#  - Enjoy Linux
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:

# comment: false # Disable comment if false.
lang: ja
#2007.4.13作成
---

<!--# maximaおぼえがき-->

maxima つかいかたメモ

<!--more-->

-   命令の最後には必ずセミコロン<font color='red'> **;** </font>をつける!!
    

-   終了は

```
        quit();
```

<!--more-->

## Maximaの作法

1.  命令の最後には必ずセミコロン<font color='red'> **;** </font>をつける!!

```
	    ;
```

が入力の終了
    

2.  しかし、表示させたくないときは最後を **\$** にする\
    \$をつけると、outputは表示されないが、batch実行時のinputは表示される(勘違いしないこと)。
    

3.  コロン<font color='red'>**:**</font> が代入演算子や変数の定義など

```
        変数名: 変数の内容;
        a:2;
```

4.  関数の定義は<font color='red'>**:=**</font>

```
        関数名f(x):=x^2+x+1;
```

5.  clear 相当は kill\
    変数の内容を消去するときは

```
        kill(消去する変数名, ,...);
        kill(a);
        kill(all);/*全部クリア*/
```

6.  表示を整理

```
        simplify[f[x]]の代わりはratsimp(f(x));
        Fullsimplify[f[x]]の代わりはfullratsimp(f(x));
```

7.  コメントはC言語のように/\* \*/

```
        /* ここにコメントをかく */ 
```

## 行列

1.  行列の生成

```
		A:genmatrix(a,n,m);
```

でn行m列の行列ができる。

```
		(a1,1 a1,2)
		(a1,2 a2,2)
```

となる。
    

2.  要素への代入は(代入演算子は**:**)

```
		A[1][1]:5;
```

などとする。


3.  直接行列要素を入力する場合
	
	```
		A:matrix([1,2],[3,4]);
	```
    とすると
	
	```
		[1 2]
		[3 4]
	```
    になる。
    

4.  対角行列は

	```
		A:diagmatrix(3,2);(大きさ,数値)となる
	```

要素が変わる場合は

```
		A:apply(matrix,makelist(ident(次数)[i]*[1, 2, 3, 4などリスト],i,1,次数));
```

5.  単位行列は

```
          I:ident(n)
```

6.  行列の累乗は

```
         ^^
```

7.  行列とベクトルの積はピリオド

```
	     . 
```
    を使う

## 関数,式,表示

1.  関数の定義

	```
		f(x,y,s,t):=x^s*y^t;
	```
	
2.  表示 分数のまま表示されるが、展開したいときは

	```
         float(数値評価する式);
	```
3.  数値解

	```
         float(solve([.....]))などのようにする。
         solve([...])だけだと、分数のまま表示される。
	```

	定数も
	
	```
         float(sqrt(2));
         float(sin(30/180));
	```
    
	などとする。
    

4.  ratsimpで整理して表示(上を参照)
    

5.  coeffと同じ

```
        ratcoeff(式,項)
```

6.  解を代入

	```
		solve(a*x^2+b*x+c=0,x);
		av=ex(x, %[1]); 
	```
	
で解をavに代入できる
    

7.  %piで円周率は定義されている。
    

8.  文字で解きたい
    連立方程式の解を求める時など、文字のまま扱いたい時は、
    %を文字の前につける。 例えば
	
```
         solve([%a1*x+%b1*y=%c1,%a2*x+%b2*y=%c2],[x,y]);
```

 ただし%pi(円周率)と%i(虚数単位)などはいくつかの文字定数は使用済なので注意!!

## miscなこと

1.  helpは

	```
		describe(topic) or example(topic)  or ? topic
	```

2.  保存はsave(\`ファイル名\`\'\',all);\
    ただし、全部Lisp?で書かれているのでよくわからん。
    

3.  保存時に拡張子.tmをつけるとTeXMacs用のいろんなものが入る。
    
    拡張子無しだと、入出力結果だけ保存\
    -\>次回TeXmcsから読み込んでも使えない ??
    

4.  変数だけ保存する場合は

	```
        write_data(変数名,"ファイル名",セパレータ)
	```
	
    csv形式で保存されます。\
    セパレータは comma(\",\"), pipe(\"\|\"), semicolon(\";\"),
    \'csv::(\",\")と同じ??
    

5.  TeXで出力する時は

	```
	tex(計算式)
	```
6.  バッチファイルの実施は

	```
		batch(``ファイル名'');
	```
    ファイルの拡張子はmacを使っている例が多いようである。\
    \
    以下もあるようだが、うまく動作しない。???

	```
         loadfile(``ファイル名'');
         playback(all);で実行表示
	```

    ファイル名はフルパスで書いたほうが平和\
    \$MAXIMA\\\_DIRECTORYの　share,share1,share2,tensor
    から読み込もうとする。

7.  カレントディレクトリは 

	```
	system("pwd");
	```
	
8.  ディレクトリ変更はLispの関数を使用。

	```
		?xchdir("c:\\hoge");
	```
	
などとします。 冒頭の?はLispの関数であることを示します。

## 参考元

<!---   [Maxima入門ノート(中川先生)](./maxima-nakagawa.pdf)-->

-  Maxima入門ノート(中川先生)::接続の問題があるようなので、各自探してください。
