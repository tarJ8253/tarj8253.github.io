---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "ORGの使い方メモ" # Title of the blog post.
date: 2025-02-21T15:01:10+09:00 # Date of post creation.
description: "ORG org " # Description used for search engine.
featured: true # sidebarのおすすめの投稿, sets if post is a featured post, making appear on the home page side bar.
draft: false #true # Sets whether to render this page. Draft of true will not be rendered.
toc: false # Controls if a table of contents should be generated for first-level links automatically.
# menu: main # when uncomment, display on manu bar
#usePageBundles: false # Set to true to group assets like images in the same folder as this post.
usePageBundles: true # Set to true to group assets like images in the same folder as this post.
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
  - document write
tags:
  - org
#  - Tag_name2
#series :
#  - Easy Document
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:
# comment: false # Disable comment if false.
#2024.12.4:エクスポートオプション追記 <br />
#2024.9.9:(S99.9.9) 追記 <br />
#2024.1.5:追加修正 <br />
#2023.4.4:追加修正 <br />
#2021.8.27:初版
#<hr>
---

ORG 使いましょ

<!--more-->


## orgを使うための設定 {#orgを使うための設定}

設定はあちこちのwebサイトを参照


## orgの起動方法 {#orgの起動方法}

-   方法1. C-c cでorg-captureモードを起こして、[t]Todo,[m]memoを選んで記述

    memo開く。バッファにはCAPTURE-memo.orgと現れるが、保存時はelで設定したfile名になる。
-   方法2. 拡張子orgのファイルを開く


## 書く {#書く}


### 見出しをつける {#見出しをつける}

アスタリスク(\* \*\*)で見出し(段組み)ができます。

<strike>   アスタリスクは2つまでしか対応できていないよう</strike>

<strike>   ただし、htmlに出力するときは3つめもok</strike>


### 箇条書き {#箇条書き}

1.  まずは「-」
2.  M-RET (Alt-RET)を入力
3.  shift+右矢印すると、順に数字1,1),\*などの候補が現れて変換される。

または、先頭に-をつけて書き並べ、最後に箇条書き範囲内で、shift+右矢印して候補を確定


#### 名前付き {#名前付き}

```text
- 名前1 :: 内容1
- 名前2 :: 内容2
```


#### チェックボックスもつけれるらしい。 {#チェックボックスもつけれるらしい}

[理科系の勉強日記 Emacs org-modeで快適タスク管理　入門](https://kenbell.hatenablog.com/entry/20121116/1353072530)

```text
- [ ] チェック項目
```

と入力する。

```text
チェックボックス[1/3]
  - [X] [/]と手入力
  - [ ] 「-」を入力後，M-S-RETを入力しボックスを増やす
  - [ ]  ボックスの上でC-cとするとチェックが入る
    + [ ] 子もつくることができる
    + [ ] 子のチェックがうまると親にチェックが入る
```


### ブロック環境 {#ブロック環境}

いろいろなブロック環境があります。

[17.2 Structure Templates](https://orgmode.org/manual/Structure-Templates.html)

C-c C-, (org-insert-structure-template)

```text
a	‘#+BEGIN_EXPORT ascii’ … ‘#+END_EXPORT’
c	‘#+BEGIN_CENTER’ … ‘#+END_CENTER’
C	‘#+BEGIN_COMMENT’ … ‘#+END_COMMENT’
e	‘#+BEGIN_EXAMPLE’ … ‘#+END_EXAMPLE’
E	‘#+BEGIN_EXPORT’ … ‘#+END_EXPORT’
h	‘#+BEGIN_EXPORT html’ … ‘#+END_EXPORT’
l	‘#+BEGIN_EXPORT latex’ … ‘#+END_EXPORT’
q	‘#+BEGIN_QUOTE’ … ‘#+END_QUOTE’
s	‘#+BEGIN_SRC’ … ‘#+END_SRC’
v	‘#+BEGIN_VERSE’ … ‘#+END_VERSE’
```


### TODOをつける {#todoをつける}

-   アスタリスクの次に「1文字スペース」+「TODO」とtypeします。
-   または、アスタリスクの次に「1文字スペース」+「shift+右矢印」とkey入力すると、
    TODOが現れ、shift+右矢印を順次繰り返すと、
    TODO/DONE/無印の状態がトグルできます。
-   またはorgのファイル内で、C-c C-tとすると、その場所に近いアスタリスクの項目にTODOが付きます。


### 優先順位の印をつける {#優先順位の印をつける}

アスタリスクの次に「1文字スペース」+「shift+上矢印」とすると、

[#A]   [#B]   [#C]が順次現れ、優先順位の印としてつけることができます

-これが何に反映されるかは未調査


### 日付や時刻を記入する {#日付や時刻を記入する}

C-c .で日付: active time , 矢印カッコ

```text
<2021-08-23 月>
```

C-u  C-c .で時刻と日付

```text
<2021-08-23 月 11:00>
```

C-c ！で日付: inactive time , カギカッコ, agendaに表示されない

```text
[2021-08-23 月]
```

C-u  C-c !で時刻と日付, agendaに表示されない

```text
[2021-08-23 月 11:00]
```

[org-mode reference card](https://orgmode.org/worg/orgcard.html)

[Emacs org-modeを使ってみる: (11) キーバインド3/3](https://tamura70.hatenadiary.org/entry/20100213/org)

C-c C-dでDEADLINEの時刻と日付が見出しに付きます。

```text
DEADLINE: <2021-08-23 月 12:00>
```

C-c C-sでSCHEDULEDの時刻と日付が見出しに付きます。

```text
SCHEDULED: <2021-08-23 月 03:00>
```

が記入できます。

時刻は手入力しますが、日付はカレンダーが現れ、shift+矢印で移動して所要の日付を選ぶこともできます。

orgのファイル内で、C-c C-sとするとスケジュール、C-c C-dとすると締切(dead line)が付きます。

key-bind参照のこと。


### ショートカット {#ショートカット}

alt + 左右矢印::　\*を増減

alt + 上下矢印::　まるごと上下に移動

Ctrl-c Ctrl-n:: 次の項目にジャンプ

Ctrl-c Ctrl-p:: 前の項目にジャンプ

C-c C-x C-w:: 項目ごとcut

C-c C-x C-y:: 項目ごとpaste

アスタリスクのある行でShift-左右矢印::無印/ToDo/DONEの切り替えがてきる

C-c . 日(active time)<span class="timestamp-wrapper"><span class="timestamp">&lt;2025-02-26 水&gt;</span></span>/ C-c !, inactive time<span class="timestamp-wrapper"><span class="timestamp">[2025-02-26 水]</span></span>

C-u C-c . 日時,active time<span class="timestamp-wrapper"><span class="timestamp">&lt;2025-02-26 水 11:09&gt; </span></span> /C-u C-c !, 日時, inactive time<span class="timestamp-wrapper"><span class="timestamp">[2025-02-26 水 11:08]</span></span>

C-c C-sでschedule Date+time

C-c C-dでdeadline Date+time


#### 作業時間計測 {#作業時間計測}

C-c C-x TABでclock in: 作業開始前

C-c C-x C-oでclock out: 作業終了

作業時のorgの項目(\*)のなかにLOGBOOKの項目が追記され、

C-c C-x TABで開始時刻

C-c C-x C-oで終了時刻

が追記され、終了時に作業時間も同時に追記される


### 時刻表示 {#時刻表示}

-   三角カッコ&lt;&gt;はactive time: agendaに現れる
-   カギカッコ[]はinactive time: agendaに現れない

-   カッコ上にカーソル動かしてshift+上矢印でトグルできる
-   日付や時間はshift+矢印(上下左右)で編集できる


## 見る {#見る}

-   C-a aでagenda(todo.org:(agend-fileで設定):の内容)
-   C-M-^(ctrl+alt+^)でmemo(elで設定)


## LINKの貼り方 {#linkの貼り方}

参考サイト
[内部リンクもできる](https://tamura70.hatenadiary.org/entry/20100209/org)

```text
[[エクスポートする]]
```

のように記述すれば，同一ファイル内の「文字列」を含む最初の行にリンクできる

[#ID]
[\*ID]

エイリアスを用いてリンクを表現する:フルパスを書かずに、下記例だとdocで省略できます

```text
#+link: doc file+sys:/Users/hoge/Documents/PDF/
[ [doc:a.pdf ] [ 手法1 ] ]
[ [doc:b/c.pdf] [手法2] ]
```


### テキストファイルへのリンク {#テキストファイルへのリンク}

同一emacs内でリンク可:別emacsプロセスで引用先ファイルを開いたら、リンクできない

引用元ファイルで、C-c lでstored

引用先ファイルで、C-c C-lで貼り付け

```text
[[file:MOvie-Howto::Layer毎にD&Dして取り込む。][MOVIE_howto]]
```


### URLへのリンク {#urlへのリンク}

[ [ URL ] [ テキスト ] ]  としたら文書中にリンクを埋め込めて、
C-c C-oするとブラウザが開いてジャンプできる。(要ブラウザ設定)。

リンクを編集するには、ハイパーリンクの後ろでBackSpaceをtypeする(]を削除)か、
OrgメニューのHyperlinksを開き，Literal linksを選択する．

C-c C-l tabで リンク補完が効くので

```text
[[https:google.co.jp][gg]]
```

も簡単に入力できる

参考URL: [リンクの仕方](https://qiita.com/takaxp/items/96629bbcc4a9403f0213)


### 図へのリンク {#図へのリンク}

同様に簡単な方法で貼り込みできます。

```text
[[./foga.png]]
```


## 特殊文字 {#特殊文字}

バッファ中での設定の要約

キーワードには

```text
ARCHIVE,LINK,PROPATIESTITLE,AUTHORなど
TBLFM
STARTUP
LATEX_HEADER
```

などなど、たくさんある


### ソースコードなどを書く {#ソースコードなどを書く}

前述のブロック環境を用います。

テキスト文書の中に、ソースコードも混在できます。

```text
#+begin_example

#+end_exampleは<pre>

#+BEGIN_SRC ソースコード種類

#+END_SRC

#+BEGIN_SRCの後ろでC-M-i(Ctrl+Alt+i)を押すとOrgが対応している言語の一覧がでてくる。
```


### TeXの数式を書く {#texの数式を書く}

[13.9.11 Math formatting in HTML export](https://orgmode.org/manual/Math-formatting-in-HTML-export.html)

最初の行に

```text
#+HTML_MATHJAX: align: left indent: 5em tagside: left font: Neo-Euler
```

または

```text
#+OPTIONS:LaTeX: t
```

を書くとhtmlにexportしたときに数式が現れましたが、なくてもできました!???

\\(\int \_0^\infty f(x) \dfrac{d g(t)}{dt}dx\\)

org文書中にinline表記するには、dvipngが必要です。


## 見やすくする {#見やすくする}


### 折りたたむ {#折りたたむ}

-   shift-tabで SHOW-ALL/OVERVIEW/CONTENTSをトグル

-   文書全体の折りたたみ
    C-u C-i または C-u tab

-   アスタリスク行位置での折りたたみ  tab または Ctrl-i


## 検索できるようにタグやプロパティをつける {#検索できるようにタグやプロパティをつける}


### タグ {#タグ}

見出しには複数のタグをつけることができる
C-c C-c

タグは手入力もできるけど、初期指定できます。
<https://maskaw.hatenablog.com/entry/2018/09/21/205910>

```lisp
;; タグリスト
(setq org-tag-alist '(("meeting" . ?m) ("office" . ?o) ("document" . ?d) ("kitting" . ?k) ("study" . ?s) ("travel" . ?t) ))
```


### プロパティ {#プロパティ}

プロパティは名前と値をもつことができる
:(コロン)で前後を囲まれたキー(語句)と、その後に値をもつ1行で記述

C-c C-x p

```text
* 見出し
 :PROPERTIES:
 :name:      1
 :END:
```

見出し(\* hoge / \*\* uga)に空行を挟まずに続けて記入する。

```text
:Xyz_ALL:のようにすることで、:Xyz:の許容値を定義できる
```

とされているけどまだ理解できていない

プロパティの名前はデフォルトで

```text
ARCHIVE 	CATEGORY 	CLOCK_MODELINE_TOTAL
COLUMNS 	COOKIE_DATA 	CUSTOM_ID
DESCRIPTION 	EXPORT_AUTHOR 	EXPORT_DATE
EXPORT_FILE_NAME 	EXPORT_OPTIONS 	EXPORT_TEXT
EXPORT_TITLE 	Effort 	HTML_CONTAINER_CLASS
LOCATION 	LOGGING 	LOG_INTO_DRAWER
NOBLOCKING 	ORDERED 	REPEAT_TO_STATE
STYLE 	SUMMARY 	TABLE_EXPORT_FILE
TABLE_EXPORT_FORMAT 	UNNUMBERED
VISIBILITY
```

自分でつけた名前も自動登録される


### タグやプロパティを検索する {#タグやプロパティを検索する}

C-c / は M-x org-sparse-tree が割り当てられています。
C-c / で　検索のルートに行き、検索できるメニュー[/,m , p ,d ]などが現れる。

-   タグの検索は C-c / m

-   プロパティの検索は C-c / p

検索語に+をつけるとAND, | をつけるとOR -をつけると否定

プロパティの検索条件も指定できる．たとえば，以下はPROJECTタグを持ち， LOCATIONプロパティが「第1会議室」に一致する見出しを検索する．

```text
* 第1回ORG会議 <2010-02-26 金 13:30-14:30> :PROJECT:
  :PROPERTIES:
  :LOCATION: 第1会議室
  :END:
```

+PROJECT+LOCATION="第1会議室"

検索には以下の特殊プロパティ名も利用できる．

```text
TODO 	TODOキーワード
TAGS 	タグ(見出しに指定されているもの)
ALLTAGS 	タグ(継承されたものも含む)
CATEGORY 	カテゴリー
PRIORITY 	優先度
DEADLINE 	DEADLINEの日時
SCHEDULED 	SCHEDULEDの日時
CLOSED 	CLOSEDの日時
TIMESTAMP 	タイムスタンプ
TIMESTAMP_IA 	非活性なタイムスタンプ
CLOCKSUM 	CLOCKの合計
ITEM 	見出しの内容
```

数値の比較

数値の比較については，&lt;, &lt;=, &gt; &gt;= を使用できる．日時の比較は，

```text
「DEADLINE<"<2010-03-01>"」のように記述する．
「"<2010-03-01>"」のように直接日時を指定するのでなく，「"<now>"」，「"<today>"」，「"<tomorrow>"」，「"<+5d>"」のようにも記述できる．
```


### 検索結果を見やすくする {#検索結果を見やすくする}

るびきちさんちでは、indirect-bufferを用いて、検索結果表示を見やすくする方法あり

[Emacs org-modeの検索機能を16倍パワーアップする方法](http://emacs.rubikitch.com/org-sparse-tree-indirect-buffer/)

タグとプロパティ参考URL:[屯遁のパズルとプログラミングの日記](https://tamura70.hatenadiary.org/entry/20100301/org)


## エクスポートする {#エクスポートする}

C-c C-eの後、dispatcherが開く。

defaultでExport可能な形式は,ASCII, HTML, iCalendar, LaTeX, and ODT.

hhならHTML,
 llとしたらtex(pdflatexが標準)に変換したファイルが保存される。

```text
M-x org-latex-export-to-latex
```

または

```text
M-x org-latex-export-as-latex
```


### エクスポートオプション {#エクスポートオプション}

ヘッダ部(frontmatter?)に以下を書くと便利かも

```text
#+TITLE: HOGE
#+AUTHOR: HOGEFUGA
#+DATE: 1999/9/9
#+EMAIL: hoge@fuga
#+LANGUAGE: ja
#+OPTIONS: author:nil email:nil creator:nil toc:nil timestamp:nil
```

OPTIONS行は以下をよく用います。

```text
#+OPTIONS: toc:nil ^:{} timestamp:nil
```

^:{}はアンダーバーをそのまま表示する(下付き上付きを行わない。混在するときは波括弧で囲む)ときは必須です。

参考元:[OrgModeマニュアル,12.2エクスポートオプション](https://takaxp.github.io/org-ja.html#g_t_00e3_0082_00a8_00e3_0082_00af_00e3_0082_00b9_00e3_0083_009d_00e3_0083_00bc_00e3_0083_0088_00e3_0082_00aa_00e3_0083_0097_00e3_0082_00b7_00e3_0083_00a7_00e3_0083_00b3)

[orgmode.org 13.2 Export Settings](https://orgmode.org/manual/Export-Settings.html)


### export形式を増やす {#export形式を増やす}

init.elで(require 'ox-md)しておけば md形式、 (require 'ox-beamer)しておけば beamer形式にexportできる

ox-gfm(github flavored),ox-hugo,ox-pandoc,ox-reportなどいろいろあり


### htmlにexportした文字に色を付ける {#htmlにexportした文字に色を付ける}

orgでの方法がわからなかったので、htmlのタグを利用

htmlのタグをそのままexportするときは

```text
@@html:<font color='red'>@@ hoge @@html:</font>@@
```

<font color='red'> hoge </font>

のようにタグを

```text
@@html: tag @@
```

で囲む 。

または、html環境にする?

<font color='red'>hoge fuga </font>

上記は以下ソース

```text
#+begin_export html
<font color='red'>hoge fuga </font>
#+end_export
```

このhtmlはorgで作成後、exportしたもので、cssやindexも自動で追加されている。

参考URL:

-   [Orgの使い方](https://tamura70.hatenadiary.org/entry/20100207/or)
-   [org manual](https://takaxp.github.io/org-ja.html)
