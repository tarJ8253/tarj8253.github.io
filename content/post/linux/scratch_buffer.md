---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: " Emacsスクラッチバッファで計算" # Title of the blog post.
date: 2025-03-04T15:46:46+09:00 # Date of post creation.
description: "Article description." # Description used for search engine.
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
  - Emacs
  - scratch buffer
#series :
#  - Enjoy Linux
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:

# comment: false # Disable comment if false.

lang: ja
#2019.9.2
---

<!--# Emacsスクラッチバッファで計算-->



Emacsの\*scratch\*バッファで計算するための備忘録\
\
scratchバッファではEmacsで設定しているlisp式の評価などを行えますが、
各種計算が簡単にできるので重宝してます。

<!--more-->

1. 使い方: もちろんEmacsのscratch bufferの中で遊びましょう。

	a.  変数名やカッコの後ろでC-j(Controlキーとjを同時に押す)と、変数名や カッコ内が評価される。
	b.  カッコの中に数式を書くと演算ができる。
	c.  除算する時は数値は実数(x.0)と書く。いわゆる整数演算すると小数点以下が得られません。
	d.  演算子は最初に書く。

2. 使い方例(;以降はコメントを示します)

	a.  (+ 1 2) ;; 1+2のことです
	b.  (\* 3 4) ;; 3\*4のことです。
	c.  (/ 3 4) ;;
		3/4のことです。このまま評価したら0になるので、どちらかを.0にしましょう。

3. 関数を使う。

	a.  (expt a b) ; a\^b乗

	b.  (sin (\* (/ pi 180) 30)); 円周率にpiが使えます。\
    asin,acos,atanもあります。

	c.  (/ 1e-6 2) ;10のべき乗が使えます。

	d.  16進数に変換 (format \"%x\" 255)

	e.  10進数に変換　ここだけカッコを使いません。

	```
		#xff
		?\xdd
	```

	最後で評価すると10進数が得られます。

	f. 変数に代入 (setq hoge 10)\
    hogeという変数名に10という数値を代入します。
    setfもあるそうで、機能が異なるそうです。

	

4. ちょっとしたプログラム

	```
		(progn
		(setq a 5)
		(/ (* 96 1e-6 ) 3.0  a (+ a 1))
		)
	```

	とすると、 aの値を変数扱い(a=5)として

	```
		(96*10^-6)/3/a/(a+1)
	```

	の結果が得られます。
	
	とっても簡単便利です。
