---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "Asciidocの始め方"
date: 2025-03-10T11:10:41+09:00
description: "Asciidoc" # Description used for search engine.
featured: true # sidebarのおすすめの投稿, sets if post is a featured post, making appear on the home page side bar.
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
 - document write
tags:
 - asciidoc
#series:
# - Enjoy Linux
#comments: false
description: "Asciidoc"
#keywords:
isCJKLanguage: true
:icons: font
#//:Author: 瀧山武
#//:Email: tak@hoge
#:Date: 2024.8.28
#:Revision: 0.01
#:lang: ja
#:myname: HHH
#:nofooter:
#= **Asciidoc** の始めかた
#v.1.0, 2024.9.9
---

<span id="header"></span>

# **Asciidoc** の始めかた

v.1.0, 2024.9.9  
<span id="content"></span>

<span id="preamble"></span>

マークアップ方式でテキスト記述。htmlやpdfに変換できる。

md(マークダウン)より方言が少なく、表(table)の表現能力は高いらしい。

``` example
環境 bookwarm (debian 12.6)
```
<!--more-->
``` example
$ asciidoctor -v
Asciidoctor 2.0.18 [https://asciidoctor.org]
Runtime Environment (ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux-gnu]) (lc:UTF-8 fs:UTF-8 in:UTF-8 ex:UTF-8)
```

<span id="anc1"></span>

-   Emacsで書いてます。  
    拡張子はadocが標準みたい

    -   elisp :
        package-list-packgeからadoc-modeとmarkup-faces(関連)をinstall

    -   以下をinits/ (init-loader管理)においた

``` commonlisp
;; asciidoc mode from https://github.com/sensorflo/adoc-mode
;;https://qiita.com/YasuhiroABE/items/76d4f17792aded97ea94
;(load "~/lib/elisp/markup-faces.el")
;(load "~/.emacs.d/elpa/markup-faces-2024218.1085/adoc-mode.el")
;(load "~/lib/elisp/adoc-mode.el")
;(load "~/.emacs.d/elpa/adoc-mode-2024218.1085/adoc-mode.el")
(autoload 'adoc-mode "adoc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
;; update timestamp for adoc-mode
(add-hook 'adoc-mode-hook (lambda()
                (require 'time-stamp)
                (add-hook 'before-save-hook 'time-stamp)
                (custom-set-variables
                 '(time-stamp-active t)
                 '(time-stamp-start "date: ")
                 '(time-stamp-format "%Y-%02m-%02dT%02H:%02M:%02S%:z")
                 '(time-stamp-end "$"))))
```

<span id="asciidoc形式で書く"></span>

## 1.Asciidoc形式で書く

紹介,参考サイトいろいろ

[Asciidoc Language
Documentation](https://docs.asciidoctor.org/asciidoc/latest/)

[Asciidoctor Documentation
site,上記のroot](https://docs.asciidoctor.org/)

[Asciidoctor
文法クイックリファレンス(日本語訳)](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/)

[asciidoc memo](https://keijidosha.github.io/memo/docs/asciidoc.html)

[Asciidocチートシート](http://www.venus.dti.ne.jp/~iisaka/DocSys/cheatsheet-ja/asciidoc-869/asciidoc-869.html)

[AsciiDoc vs Markdown 比較チートシート](https://ryuta46.com/344)

### 簡単な文法

1.  1.0 セクションヘッド

    イコール(=)がレベル0のセクションヘッド。レベル5まであるそうです。

2.  1.1　テキストフォーマット

    \#や\*で挟んだ範囲がマークアップ対象。

    マークアップ箇所前後の 半角空白1文字 分が大事です

    \[の前と#の後ろに空白入れるのが大事

    -   原稿

    ``` example
    **bold太字**
    _いたりっく_

    いろつけ #しなもん# マーカー
    [red]#色指定# 空白大事

    [yellow-background]#背景色#
    [red yellow-background big]#文字色　背景色　サイズ#

    とと [.big]#おおきく# なったら　
    とと [big]#おおきく# bigの前のドットがなくてもok!bigより大きい字は不明
    とと [small]#小文字# こもじ

    免許 [line-through]#とりけし# なったら
    かせん [underline]#下線# ひいて
    うえせん [overline]#上線# ひいて

    ととと ^上付き^ 文字と
    ほげ ~下付き~ 文字

    ////
    以下はrightのみ効いた
    [center]#まんなか#
    [left]#左#
    [right]#右#
    [justify]#ちょうど#
    ////
    ```

    -   出力結果

    **bold太字** *いたりっく*

    いろつけ しなもん マーカー 色指定 空白大事

    背景色 文字色　背景色　サイズ

    とと おおきく なったら　 とと おおきく
    bigの前のドットがなくてもok!bigより大きい字は不明 とと 小文字 こもじ

    免許 とりけし なったら かせん 下線 ひいて うえせん 上線 ひいて

    ととと <sup>上付き</sup> 文字と ほげ <sub>下付き</sub> 文字

    asciidocをpandoc/hugoで処理した時、文字色表示がうまくできていません。sorry!
    そのうち解決します。

    ``` example
    行頭1文字スペースはリテラル(1行)
    ```

    -   改行は `+`

    -   コメントは `//`

    -   改ページは =\<\<\<=　これは未確認。pdfで効くのかな?

    -   水平罫線　'''　これはバッククォートではなくクォート(アポストロフィ)です。
        3つ以上続けても変化はないようです。

    ------------------------------------------------------------------------

    ------------------------------------------------------------------------

    -   エスケープ +3つで挟む {esc} \\{esc} 変換されなくなるみたい。

    -   バックスラッシュもエスケープするみたい。csvファイル読み込みの。

    -   バッククオート　\`で挟むとコマンド表示

    -   クオートで挟むとパス表示 'hoge/fuga/as.adoc' でも
        hoge/fuga/as.adoc と違いがわからず。

    -   特殊文字 (C) (R) (TM) – … -\> \<- `> <` ¶ 左の文字は右になります
        © ® ™ — …​ → ← ⇒ ⇐ ¶

    -   脚注とアイコン

        -   原稿

    ``` example
    * ほげとはfootnote:[ここの内容が脚注になります]
    * icon:twitter[role=aqua] 他のアイコンは不明???
    ```

    -   出力

        -   ほげとは<sup>\[[1](#_footnotedef_1)\]</sup>

        -   // 他のアイコンは不明???

3.  1.2 リスト形式

    ``` example
    * レベル1
    ** れれれ2
    *** レベル3

    -[*] check +
    -[x] check2 +
    -[ ] noch3 +
    - checkboxは改行マーク要 +

    . 手順1
    . 手順2
    .. 手順2-2

    1から始めるためには、ここに何か文字を入れる。

    . 手順1
    . 手順2
    [arabic]
    .. 手順2-2 オプションとしてarabicと書けばaが数字になります。

    [square]
    * item 1 オプションでsquare 指定しました。
    * item 2
    ```

    -   レベル1

        -   れれれ2

            -   レベル3

    -\[\*\] check  
    -\[x\] check2  
    -\[ \] noch3  
    - checkboxは改行マーク要  

    -   手順1

    -   手順2

        1.  手順2-2

    1から始めるためには、ここに何か文字を入れる。

    1.  手順1

    2.  手順2

        1.  手順2-2 オプションとしてarabicと書けばaが数字になります。

    3.  item 1 オプションでsquare 指定しました。

    4.  item 2

4.  1.3 囲んでブロックにする。

    [Summary of structural
    containers](https://docs.asciidoctor.org/asciidoc/latest/blocks/delimited/#summary-of-structural-containers)

    [Summary of built-in
    blocks](https://docs.asciidoctor.org/asciidoc/latest/blocks/build-basic-block/#summary-of-built-in-blocks)

    \(1\) ====で囲む。Example Blocks. example type. compound.

    Example 1. st

    -   =4つで囲んだ例

        -   =の上の.がタイトル

            -   Exampleというのがつく \[caption="Hoge:
                "\]としら変更できる

    \[example\]と同じ,ただし上記のように内部ブロック書けず、単純標記だけ

    ``` example
    [example]
    ほげ
    ふが
    ```

    ほげ ふが

    \(2\) —-で囲む。Listing Blocks, listing type. verbatim.

    title

    ``` example
    * ハイフン(-)4つで囲んだ例, pre
    ** ハイフン(-)の上の行に.titleとすると、左上に見られるようにtitleが表示されるが、なくてもよい
    *** ソースコード書くときはこの方法。言語指定はハイフン前の上の行に[source, octave]などと書く
    ```

    \(3\) **\*\*** で囲む。 Sidebars, sidebar type. compound.

    hoge

    -   アスタリスク4つで囲むと、タイトルを中央表示したブロックになる

    -   \*の直前の.hogeがタイトルになる  
        フレームで囲まれている  
        リスト形式にしない場合、改行記号(+)必要

    \(4\) ~~++~~ で囲む。Passthrough blocks, pass type, raw

    改行されないので注意。

# 1 \*\* 2 **\*** 3

htmlのタグをかける!

## h2タグでこんなふうHOGE

\(5\) ピリオド4つで囲む。 Literal Blocks, literal type. verbatim.

``` example
period
eeeee
```

-ハイフンと出力見た目同じ。 改行不要

\(6\) *//* で囲むと、ブロックコメント。Comment Blocks, comment type

``` example
////
ブロックコメント
ととと
////
```

\(7\) \_ \_ \_ \_ アンダーバー4つで囲むとquote

> quote

または、\[quote\] 宣言

``` example
[quote]
quote block +
quoteとオプション
```

> quote block  
> quoteとオプション

\(8\) ハイフン2つ。 open type. compound.

ハイフン2つはオープンブロック,出力??

(9)ラベルをつけたいときはコロン::で区切る

-   原稿

``` example
くら::
ssss
すし::
xad
```

-   変換出力

    くら  
    ssss

    すし  
    xad

\(10\) インラインはバッククオート｀#｀

<span id="ancc"></span>

1.4 リンク、イメージ、インクルード

\(1\) URLは直書き

<https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/>

<https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/>

後ろにかっこ\[\]つけたら、URL見えず、名前だけ

<https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/%5BAsciidoc>　クイックリファレンス\]

[Asciidoc　クイックリファレンス](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/)

\(2\) 文書内外参照:　linkとanchor

-   他文書へのリンク

``` example
link:文書名[表記文字]
link:a.adoc[参考文献]
```

[参考文献](a.adoc)(a.adocがあれば開きます)

-   html文書限定リンク

ファイル名には拡張子不要。この場合はa.htmlを意味。

``` example
<<ファイル名#タグ, 表記文字>>
<<a#aam,a.htmlへのリンク>>
```

[a.htmlへのリンク](a.html#aam)(a.htmlがあれば開きます)

-   同一文書内link,anchorが必要です

``` example
<<アンカー名,表示名>>

<<anc1,anc1へのリンク>>

<<ancc,anccへのリンク>>
```

アンカーをつける必要があります。
ただし、asciidocで作成したhtmlファイルのセクション名には
idタグが付与されているので、anchorの設定は不要。
ただし、anchorとなったセクション名のピリオドや英大文字が変換されているので注意。
下記のanchor説明を参照。

-   anchorをつける

``` example
[[anc1]]

[#anc2]

<<ancc>>

anchor:ancc[]
```

asciidocで作成したhtmlファイルのセクション名には
idタグが付与されているので、anchorの設定は不要。

引用元ではセクション名を書くだけ。ただし、最初にアンダーバーを付与することが必須!。

また、ピリオドや英大文字が変換されているので注意

adocを他のmarkup形式に変換するとき、このアンダーバーのリンクが引き継がれない場合があるので注意。

``` example
<<_1_asciidoc形式で書く,Asciidoc形式で書く>>

<<_1_5_admonotions_パラグラフをアイコン標記,アイコン標記>>

<<_2_1_環境構築,変換出力環境構築>>
```

こんなふうになります。

[Asciidoc形式で書く](#asciidoc形式で書く)

[アイコン標記](#admonotionsパラグラフをアイコン標記)

[変換出力環境構築](#環境構築)

\(3\) 画像

(3-1)インライン表示

-   原稿

``` example
インライン表示 image:./fig/sp.png[]
```

-   変換出力

インライン表示 ![](./fig/sp.png)

(3-2)ブロック表示

コロン2つ

-   原稿

``` example
image::./fig/sp.png[]
```

-   変換出力

![](./fig/sp.png)

\(4\) include　他ファイルを取り込む

include::./hoge.adoc\[\]

\[\]のなかに\[3-5\]などとして、引用する行を指定できる

<span id="admonotionsパラグラフをアイコン標記"></span>

1.5 Admonotions:: パラグラフをアイコン標記

IMPORTANT, NOTE, TIP, WARNING, CAUTIONをブロック表示

ヘッダ部(プリアンブル)に以下を記述する

`:icons: font`

宣言なければ、アイコン無しで文字で表示

改行しないと反映しない場合があるので注意!!

-   原稿

``` example
[IMPORTANT] 重要事項 改行しないと反映されない

[IMPORTANT]
重要事項
改行するとok

IMPORTANT: 重要事項 改行しない場合はコロン:で区切る

[NOTE]
のーと

[TIP]
ちっぷす

WARNING: 警告


CAUTION: 注意
```

-   変換出力

asciidocをpandoc/hugoで処理する時、以下のアイコン表示がうまくできていません。sorry!
そのうち解決します。

\[IMPORTANT\] 重要事項 改行しないと反映されない

|     |                       |
|-----|-----------------------|
| //  | 重要事項 改行するとok |

|     |                                          |
|-----|------------------------------------------|
| //  | 重要事項 改行しない場合はコロン:で区切る |

|     |        |
|-----|--------|
| //  | のーと |

|     |          |
|-----|----------|
| //  | ちっぷす |

|     |      |
|-----|------|
| //  | 警告 |

|     |      |
|-----|------|
| //  | 注意 |

1.6 式を書く

式は :stem:を宣言

-   原稿

``` example
インライン形式の式表示

インラインの式 stem:[ \int f(x)] 記述

:stem: latexmath
としたらLatex記法

改行形式にしたいときは

[stem]
++++
\sum_0^\infty f(z) \\
\int_0^\infty \sqrt{2}\dfrac{d}{dt}f(t)\sin{\theta(\tau)}d\tau
++++
```

-   変換出力

インライン形式の式表示

インラインの式 \\$ ∫ f(x)\\$ 記述

としたらLatex記法

改行形式にしたいときは

$$\\sum_0^\\infty f(z) \\\\ \\int_0^\\infty
\\sqrt{2}\\dfrac{d}{dt}f(t)\\sin{\\theta(\\tau)}d\\tau$$

1.7 表をつくる

-   基本

    1.  1行の始まりは\|とし、行終わりには\|をつけない。

    2.  最初の1行は改行を含めずに記述。

``` example
|===
| hoge | fuga | pon

|a
|v
|c
|===
```

| hoge | fuga | pon |
|------|------|-----|
| a    | v    | c   |

-   cols属性が未指定のときは、最初の1行目のカラム数がテーブル列数

-   最初の行の後が空行のときは、最初の行はヘッダ行とみなされる。

-   以下の設定を\|===の前に指定する

    -   \[cols="2\*", options="header"\]  
        cols属性の\*は繰り返しを表す演算子である。この場合4つのカラム全てにデフォルトのフォーマットが適用されます。
        ヘッダー行が１行で定義されていない場合は、cols属性でカラム数を指定し、options属性を指定する必要があります。

    -   \[cols="1,1,2", options="header"\]  
        colsでこのように指定すると、カラム数は３で、それぞれの列幅が1:1:2になるように表示されます。

-   CSVデータを使う

``` example
[format="csv", options="header"]
|===
アーティスト,トラック,ジャンル
Baauer,Harlem Shake,Hip Hop
The Lumineers,Ho Hey,Folk Rock
|===
```

| アーティスト  | トラック     | ジャンル  |
|---------------|--------------|-----------|
| Baauer        | Harlem Shake | Hip Hop   |
| The Lumineers | Ho Hey       | Folk Rock |

-   CSVデータ読み込み

``` example
[format="csv"]
|===
include::./hoge.csv[]
|===
```

|     |     |     |
|-----|-----|-----|
| a   | b   | c   |
| s   | d   | e   |

-   揃え記号

    -   \< ^ \>で、横方向の　左寄せ、中央、右寄せ

    -   dot(.)を前につける(.\< .^ .\>)と、縦方向の揃え

    -   n+でセル結合

-   まとめて設定するときは、option部で指定

``` example
[cols="^,<,>"]
|===
|中央 |左 |右

|center
|left
|right
|===
```

| 中央   | 左   | 右    |
|--------|------|-------|
| center | left | right |

-   \|の前に、揃え記号を記述すると、セルごとの揃え指定

``` example
|===
<|左寄せ ^|中央 >|右

2+^|2セル結合、中央寄せ
<|ひだり
|===
```

| 左寄せ              | 中央 | 右     |
|---------------------|------|--------|
| 2セル結合、中央寄せ |      | ひだり |

-   こんなこともできます

[クイックリファレンス日本語訳,整形,セル結合から引用,一部改変](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/#_整形_セル結合)

``` example
[cols="e,m,^,>s", width="25%"]
|===
|1 >s|2 |3 |4
^|5 2.2+^.^|6 .3+<.>m|7
^|8
|9 2+>|10
e|z s|a m|bbc ^|A
|===
```

e:emphasis=italicized, s:strong=bold, m:monospace,

|     |       |       |       |
|-----|-------|-------|-------|
| *1* | **2** | 3     | **4** |
| *5* | `6`   |       | `7`   |
| *8* |       |       |       |
| *9* | `10`  |       |       |
| *z* | **a** | `bbc` | **A** |

1.8 ヘッダ, frontmatter

``` example
:icons: font
:Author: who am i
:Email: who@hoge
:Date: 2024.9.1
:Revision: 0.01
:lang: ja
:toc: 目次
:imagesdir: hoge/images
:homepage: http://hohe.org
:myname: HHH
```

lang指定がないとlang=enになるので、jaと指定したほうが平和かもしれません。

ヘッダ直後の1行が、メタタグのauthorに設定されるようです。

hugoで処理するなら、mdと同じ形式のfrontmatterが必要です。

``` example
---
title: "hoge"
data: 2025-09-09
draft: true
categories:
 - hoge
tags:
 - fuga
series:
 - gaoo
description: "GAOOO"
---
```

1.9 その他

-   アトリビュート  
    ヘッダ部で宣言した名前:hoge:と
    中括弧{hoge}を置き換えしてくれるようです。  
    リビジョン{Revision}0.01  
    マイネーム{myname}HHH  
    ヘッダ直後の1行が、メタタグのauthorに設定されるようです。

-   スタイルにarticle(デフォルト)や bookがあるそうです  
    プリアンブルに :doctype: book 指定?  
    または変換オプション\`-d book\`指定

## 2.変換出力

<span id="環境構築"></span>

### 2.1 環境構築

1.  asciidoc形式で書いた文書をhtmlに変換するために、asciidoctorをapt(synaptic)でinstall  
    asciidoctor: adocで書かれたコンテンツをHTML5,DocBook,PDFなどに変換

2.  asciidoc形式で書いた文書をpdfに変換するために、asciidoctor-pdfをgem(aptにはないので注意)で
    install  
    [asciidoctor-pdfはasciidoctorとpawnを用いてpdfに変換します](https://waku-take-a.github.io/asciidoctor-pdf%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258BPDF%25E5%2587%25BA%25E5%258A%259B(%25E5%25B0%258E%25E5%2585%25A5).html)  
    gemはrubyのライブラリ

``` example
#apt install asciidoctor
#gem install asciidoctor-pdf
```

### 2.2 htmlに変換出力

``` example
$asciidoctor hoge.adoc
```

数式もきれいに展開できます。

### 2.3 pdfに変換出力

オプションがないと、日本語文字が豆腐になります。

``` example
$asciidoctor-pdf  -a pdf-theme=default-with-fallback-font hoge.adoc
```

オプションは -a scripts=cjk
という紹介も有りましたが、私の環境では上記でした。

また、-a scripts=cjkと併用する紹介もありますが、効果はよくわかりません
(fontは同じでした)。
少なくとも、pdfサイズがかなり大きく(2倍近く)なりました。

[asciidoctor-pdfで日本語を含むPDFの出力を行う](https://qiita.com/mitsu48/items/34875bbc8ba00760fe27)

このオプションについての情報は
[ここのスレッドを参考にしてください。](https://github.com/asciidoctor/asciidoctor-pdf/issues/1472)
下の方にいろいろな設定も書いてあって遊べるかもしれません。

日本語フォントしょぼいという評判? ipaではない。

1.  pdf日本語font設定 thread

    -   [docker-asciidoctorを使う方法](https://blog1.mammb.com/entry/2021/09/22/090000)  
        default-thema.ymlを編集してhoge.ymlで保存  
        asciidoctor-pdf hoge.adoc -a pdf-style=hoge.yml  
        docker-asciidoctorとはまた別??  

    -   [asciidoctor-pdfで日本語を含むPDFの出力を行う,2021年の情報](https://qiita.com/mitsu48/items/34875bbc8ba00760fe27)

    -   [備忘録:
        asciidoctorでpdf作成を行うメモ(Ubuntu18)](https://qiita.com/syuuu/items/b86891536a2ae805465e)

2.  pdfに数式を出力したい時

    ``` example
    $asciidoctor-pdf  -a pdf-theme=default-with-fallback-font -r asciidoctor-mathematical hoge.adoc
    ```

    |     |                                                             |
    |-----|-------------------------------------------------------------|
    | //  | 式をpdf上に出力するにはasciidoctor-mathematicalが必要です。 |

    数式出力環境構築:package install

    ``` example
    apt install cmake
    apt install ruby-dev
    gem install asciidoctor-mathematical
    ```

    |     |                                                                                                                                                                                             |
    |-----|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | //  | asciidoctor-mathematicalをgemしたら良いそうですが、 私の環境ではinstallエラーになりました。 include pathを修正したら良さそうなのですが、ソースの修正が必要? かもしれないので、pendingです。 |

## HUGO

Hugoで管理すると、githubでの公開展開が楽になるそうです。

Hugoをaptしたら、gitも入りました。

[Hugo + AsciidocでGitHub Pages上にブログを公開するまで
その1](https://deankh.github.io/blog/posts/dwjnjn8tbf/)

以下のことが現状です。

-   frontmatterは、mdと同じ形式で記述することが必要です。
    書かないtitleなどが表示されません。

-   文字の色つけができていません。

-   cautionなどをアイコン表示することができていません。

-   github-actionsを用いてhtmlを自動生成する際は、いろいろ知識が必要とな
    るようです。

## その他

bundlerとはgemを管理するためのツールで
複数のgemの依存関係を保ちながらgemの管理ができます。

gem install bundler

## 感想

org-modeとAsciidocの比較感想です

-   Asciidocは 凝った html出力を簡単に作成できる。html出力を主眼。

-   org-modeはスケジュールやTodo管理、文章構成検討(foldして章ごと移動できる)が簡単。とにかく書くことが目的ならorg。

-   TeX出力ならorg-modeの方が扱いやすそう  

-   include文が使えるので、とっても見やすく文書が作成できる。

-   Asciidocの文書をhugo/github-actionsで処理して公開する場合は、もう少し知識が必要なようです。
    include使うときは特に…​

<span id="footnotes"></span>

------------------------------------------------------------------------

<span id="_footnotedef_1"></span> [1](#_footnoteref_1).
ここの内容が脚注になり一番下に表示されます
