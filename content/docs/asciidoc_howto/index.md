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


<div id="header">


<div class="details">

<span id="author" class="author">v.1.0, 2024.9.9</span>  

</div>

</div>

<div id="content">

<div id="preamble">

<div class="sectionbody">

<div class="paragraph">

マークアップ方式でテキスト記述。htmlやpdfに変換できる。

</div>

<div class="paragraph">

md(マークダウン)より方言が少なく、表(table)の表現能力は高いらしい。

</div>

<div class="literalblock">

<div class="content">

    環境 bookwarm (debian 12.6)

</div>

</div>

<div class="literalblock">

<div class="content">

    $ asciidoctor -v
    Asciidoctor 2.0.18 [https://asciidoctor.org]
    Runtime Environment (ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux-gnu]) (lc:UTF-8 fs:UTF-8 in:UTF-8 ex:UTF-8)

</div>

</div>

<div id="anc1" class="ulist">

-   Emacsで書いてます。  
    拡張子はadocが標準みたい

    <div class="ulist">

    -   elisp :
        package-list-packgeからadoc-modeとmarkup-faces(関連)をinstall

    -   以下をinits/ (init-loader管理)においた

    </div>

</div>

<div class="listingblock">

<div class="content">

``` highlight
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

</div>

</div>

</div>

</div>

<div class="sect1">
<a id="_1_asciidoc形式で書く"></a>

## 1.Asciidoc形式で書く
<div class="sectionbody">

<div class="paragraph">

紹介,参考サイトいろいろ

</div>

<div class="paragraph">

[Asciidoc Language
Documentation](https://docs.asciidoctor.org/asciidoc/latest/)

</div>

<div class="paragraph">

[Asciidoctor Documentation
site,上記のroot](https://docs.asciidoctor.org/)

</div>

<div class="paragraph">

[Asciidoctor
文法クイックリファレンス(日本語訳)](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/)

</div>

<div class="paragraph">

[asciidoc memo](https://keijidosha.github.io/memo/docs/asciidoc.html)

</div>

<div class="paragraph">

[Asciidocチートシート](http://www.venus.dti.ne.jp/~iisaka/DocSys/cheatsheet-ja/asciidoc-869/asciidoc-869.html)

</div>

<div class="paragraph">

[AsciiDoc vs Markdown 比較チートシート](https://ryuta46.com/344)

</div>

<div class="sect2">

### 簡単な文法

<div class="sect3">

#### 1.1　テキストフォーマット

<div class="paragraph">

\#や\*で挟んだ範囲がマークアップ対象。

</div>

<div class="paragraph">

マークアップ箇所前後の <span class="big red">半角空白1文字</span>
分が大事です

</div>

<div class="paragraph">

\[の前と#の後ろに空白入れるのが大事

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

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

</div>

</div>

<div class="ulist">

-   出力結果

</div>

<div class="paragraph">

**bold太字** *いたりっく*

</div>

<div class="paragraph">

いろつけ <span class="mark">しなもん</span> マーカー <span
class="red">色指定</span> 空白大事

</div>

<div class="paragraph">

<span class="yellow-background">背景色</span> <span
class="red yellow-background big">文字色　背景色　サイズ</span>

</div>

<div class="paragraph">

とと <span class="big">おおきく</span> なったら　 とと <span
class="big">おおきく</span>
bigの前のドットがなくてもok!bigより大きい字は不明 とと <span
class="small">小文字</span> こもじ

</div>

<div class="paragraph">

免許 <span class="line-through">とりけし</span> なったら かせん <span
class="underline">下線</span> ひいて うえせん <span
class="overline">上線</span> ひいて

</div>

<div class="paragraph">

ととと <sup>上付き</sup> 文字と ほげ <sub>下付き</sub> 文字

</div>

<div class="paragraph">

<span
class="red">asciidocをpandoc/hugoで処理した時、文字色表示がうまくできていません。sorry!
そのうち解決します。</span>

</div>

<div class="literalblock">

<div class="content">

    行頭1文字スペースはリテラル(1行)

</div>

</div>

<div class="ulist">

-   改行は `+`

-   コメントは `//`

-   改ページは `<<<`　これは未確認。pdfで効くのかな?

-   水平罫線　'''　これはバッククォートではなくクォート(アポストロフィ)です。
    3つ以上続けても変化はないようです。

</div>

------------------------------------------------------------------------

------------------------------------------------------------------------

<div class="ulist">

-   エスケープ +3つで挟む {esc} \\{esc} 変換されなくなるみたい。

-   バックスラッシュもエスケープするみたい。csvファイル読み込みの\\includeで効いた。

-   バッククオート　\`で挟むとコマンド表示

-   クオートで挟むとパス表示 'hoge/fuga/as.adoc' でも hoge/fuga/as.adoc
    と違いがわからず。

-   特殊文字 (C) (R) (TM) -- ... -\> \<- =\> \<= ¶
    左の文字は右になります © ® ™ — …​ → ← ⇒ ⇐ ¶

-   脚注とアイコン

    <div class="ulist">

    -   原稿

    </div>

</div>

<div class="listingblock">

<div class="content">

    * ほげとはfootnote:[ここの内容が脚注になります]
    * icon:twitter[role=aqua] 他のアイコンは不明???

</div>

</div>

<div class="ulist">

-   出力

    <div class="ulist">

    -   ほげとは<sup>\[<a href="#_footnotedef_1" id="_footnoteref_1" class="footnote"
        title="View footnote.">1</a>\]</sup>

    -   <span class="icon aqua"></span> 他のアイコンは不明???

    </div>

</div>

</div>

<div class="sect3">

#### 1.2 リスト形式

<div class="listingblock">

<div class="content">

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

</div>

</div>

<div class="ulist">

-   レベル1

    <div class="ulist">

    -   れれれ2

        <div class="ulist">

        -   レベル3

        </div>

    </div>

</div>

<div class="paragraph">

-\[\*\] check  
-\[x\] check2  
-\[ \] noch3  
- checkboxは改行マーク要  

</div>

<div class="olist arabic">

1.  手順1

2.  手順2

    <div class="olist loweralpha">

    1.  手順2-2

    </div>

</div>

<div class="paragraph">

1から始めるためには、ここに何か文字を入れる。

</div>

<div class="olist arabic">

1.  手順1

2.  手順2

    <div class="olist arabic">

    1.  手順2-2 オプションとしてarabicと書けばaが数字になります。

    </div>

</div>

<div class="ulist square">

-   item 1 オプションでsquare 指定しました。

-   item 2

</div>

</div>

<div class="sect3">

#### 1.3 囲んでブロックにする。

<div class="paragraph">

[Summary of structural
containers](https://docs.asciidoctor.org/asciidoc/latest/blocks/delimited/#summary-of-structural-containers)

</div>

<div class="paragraph">

[Summary of built-in
blocks](https://docs.asciidoctor.org/asciidoc/latest/blocks/build-basic-block/#summary-of-built-in-blocks)

</div>

<div class="paragraph">

\(1\) ====で囲む。Example Blocks. example type. compound.

</div>

<div class="exampleblock">

<div class="title">

Example 1. st

</div>

<div class="content">

<div class="ulist">

-   =4つで囲んだ例

    <div class="ulist">

    -   =の上の.がタイトル

        <div class="ulist">

        -   Exampleというのがつく \[caption="Hoge: "\]としら変更できる

        </div>

    </div>

</div>

</div>

</div>

<div class="paragraph">

\[example\]と同じ,ただし上記のように内部ブロック書けず、単純標記だけ

</div>

<div class="listingblock">

<div class="content">

    [example]
    ほげ
    ふが

</div>

</div>

<div class="exampleblock">

<div class="content">

ほげ ふが

</div>

</div>

<div class="paragraph">

\(2\) ----で囲む。Listing Blocks, listing type. verbatim.

</div>

<div class="listingblock">

<div class="title">

title

</div>

<div class="content">

    *  ハイフン(-)4つで囲んだ例, pre
    ** titleはなくてもよい
    ***

</div>

</div>

<div class="paragraph">

\(3\) \*\*\*\* で囲む。 Sidebars, sidebar type. compound.

</div>

<div class="sidebarblock">

<div class="content">

<div class="title">

hoge

</div>

<div class="ulist">

-   アスタリスク4つで囲むとタイトルつけれる

-   \*の直前の.hogeがタイトルになる  
    フレームで囲まれている  
    リスト形式にしない場合、改行記号必要

</div>

</div>

</div>

<div class="paragraph">

\(4\) ++++ で囲む。Passthrough blocks, pass type, raw

</div>

\* 1 \*\* 2 \*\*\* 3

<div class="paragraph">

htmlのタグをかける!

</div>

## h2タグでこんなふうHOGE

<div class="paragraph">

\(5\) ピリオド4つで囲む。 Literal Blocks, literal type. verbatim.

</div>

<div class="literalblock">

<div class="content">

    period
    eeeee

</div>

</div>

<div class="paragraph">

-ハイフンと出力見た目同じ。 改行不要

</div>

<div class="paragraph">

\(6\) //// で囲むと、ブロックコメント。Comment Blocks, comment type

</div>

<div class="listingblock">

<div class="content">

    ////
    ブロックコメント
    ととと
    ////

</div>

</div>

<div class="paragraph">

\(7\) \_ \_ \_ \_ アンダーバー4つで囲むとquote

</div>

<div class="quoteblock">

> <div class="paragraph">
>
> quote
>
> </div>

</div>

<div class="paragraph">

または、\[quote\] 宣言

</div>

<div class="listingblock">

<div class="content">

    [quote]
    quote block +
    quoteとオプション

</div>

</div>

<div class="quoteblock">

> quote block  
> quoteとオプション

</div>

<div class="paragraph">

\(8\) ハイフン2つ。 open type. compound.

</div>

<div class="openblock">

<div class="content">

<div class="paragraph">

ハイフン2つはオープンブロック,出力??

</div>

</div>

</div>

<div class="paragraph">

(9)ラベルをつけたいときはコロン::で区切る

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

    くら::
    ssss
    すし::
    xad

</div>

</div>

<div class="ulist">

-   変換出力

    <div class="dlist">

    くら  
    ssss

    すし  
    xad

    </div>

</div>

<div class="paragraph">

\(10\) インラインはバッククオート｀#｀

</div>

<div class="paragraph">

<span id="ancc"></span>

</div>

</div>

<div class="sect3">

#### 1.4 リンク、イメージ、インクルード

<div class="paragraph">

\(1\) URLは直書き

</div>

https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/

<div class="paragraph">

<a
href="https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/"
class="bare">https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/</a>

</div>

<div class="paragraph">

後ろにかっこ\[\]つけたら、URL見えず、名前だけ

</div>

https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/\[Asciidoc　クイックリファレンス\]

<div class="paragraph">

[Asciidoc　クイックリファレンス](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/)

</div>

<div class="paragraph">

\(2\) 文書内外参照:　linkとanchor

</div>

<div class="ulist">

-   他文書へのリンク

</div>

<div class="listingblock">

<div class="content">

    link:文書名[表記文字]
    link:a.adoc[参考文献]

</div>

</div>

<div class="paragraph">

[参考文献](a.adoc)(a.adocがあれば開きます)

</div>

<div class="ulist">

-   html文書限定リンク

</div>

<div class="paragraph">

ファイル名には拡張子不要。この場合はa.htmlを意味。

</div>

<div class="listingblock">

<div class="content">

    <<ファイル名#タグ, 表記文字>>
    <<a#aam,a.htmlへのリンク>>

</div>

</div>

<div class="paragraph">

[a.htmlへのリンク](a.html#aam)(a.htmlがあれば開きます)

</div>

<div class="ulist">

-   同一文書内link,anchorが必要です

</div>

<div class="listingblock">

<div class="content">

    <<アンカー名,表示名>>

    <<anc1,anc1へのリンク>>

    <<ancc,anccへのリンク>>

</div>

</div>

<div class="paragraph">

アンカーをつける必要があります。
ただし、asciidocで作成したhtmlファイルのセクション名には
idタグが付与されているので、anchorの設定は不要。
ただし、anchorとなったセクション名のピリオドや英大文字が変換されているので注意。
下記のanchor説明を参照。

</div>

<div class="ulist">

-   anchorをつける

</div>

<div class="listingblock">

<div class="content">

    [[anc1]]

    [#anc2]

    anchor:ancc[]

</div>

</div>

<div class="paragraph">

asciidocで作成したhtmlファイルのセクション名には
idタグが付与されているので、anchorの設定は不要。

</div>

<div class="paragraph">

引用元ではセクション名を書くだけ。

</div>

<div class="paragraph">

ただし、ピリオドや英大文字が変換されているので注意

</div>

<div class="listingblock">

<div class="content">

    <<_1_asciidoc形式で書く,Asciidoc形式で書く>>

    <<_1_5_admonotions_パラグラフをアイコン標記,アイコン標記>>

    <<_2_1_環境構築,変換出力環境構築>>

</div>

</div>

<div class="paragraph">

こんなふうになります。

</div>

<div class="paragraph">

[Asciidoc形式で書く](#_1_asciidoc形式で書く)

</div>

<div class="paragraph">

[アイコン標記](#_1_5_admonotions_パラグラフをアイコン標記)

</div>

<div class="paragraph">

[変換出力環境構築](#_2_1_環境構築)

</div>



<span class="red">asciidocをhugoで処理する時、諸般の事情でadoc-html-mdと変換
したのでリンクタグ処理がうまくできず、この文書は手動でtag設定しています。
そのうち解決します。</span>



<div class="paragraph">

\(3\) 画像

</div>

<div class="paragraph">

(3-1)インライン表示

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

    インライン表示 image:sp.png[]

</div>

</div>

<div class="ulist">

-   変換出力

</div>

<div class="paragraph">

インライン表示 <span class="image">![sp](fig/sp.png)</span>

</div>

<div class="paragraph">

(3-2)ブロック表示

</div>

<div class="paragraph">

コロン2つ

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

    image::sp.png[]

</div>

</div>

<div class="ulist">

-   変換出力

</div>

<div class="imageblock">

<div class="content">

![sp](./fig/sp.png)

</div>

</div>

<div class="paragraph">

\(4\) include　他ファイルを取り込む

</div>

<div class="paragraph">

include::./hoge.adoc\[\]

</div>

<div class="paragraph">

\[\]のなかに\[3-5\]などとして、引用する行を指定できる

</div>

</div>

<div class="sect3">
<a id="_1_5_admonotions_パラグラフをアイコン標記"></a>

#### 1.5 Admonotions:: パラグラフをアイコン標記

<div class="paragraph">

IMPORTANT, NOTE, TIP, WARNING, CAUTIONをブロック表示

</div>

<div class="paragraph">

ヘッダ部(プリアンブル)に以下を記述する

</div>

<div class="paragraph">

`:icons: font`

</div>

<div class="paragraph">

宣言なければ、アイコン無しで文字で表示

</div>

<div class="paragraph">

<span class="red">改行しないと反映しない場合があるので注意!!</span>

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

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

</div>

</div>

<div class="ulist">

-   変換出力

</div>

<div class="paragraph">

<span
class="red">asciidocをpandoc/hugoで処理する時、以下のアイコン表示がうまくできていません。sorry!
そのうち解決します。</span>

</div>

<div class="paragraph">

\[IMPORTANT\] 重要事項 改行しないと反映されない

</div>

<div class="admonitionblock important">

|     |                       |
|-----|-----------------------|
|     | 重要事項 改行するとok |

</div>

<div class="admonitionblock important">

|     |                                          |
|-----|------------------------------------------|
|     | 重要事項 改行しない場合はコロン:で区切る |

</div>

<div class="admonitionblock note">

|     |        |
|-----|--------|
|     | のーと |

</div>

<div class="admonitionblock tip">

|     |          |
|-----|----------|
|     | ちっぷす |

</div>

<div class="admonitionblock warning">

|     |      |
|-----|------|
|     | 警告 |

</div>

<div class="admonitionblock caution">

|     |      |
|-----|------|
|     | 注意 |

</div>

</div>

<div class="sect3">

#### 1.6 式を書く

<div class="paragraph">

式は :stem:を宣言

</div>

<div class="ulist">

-   原稿

</div>

<div class="listingblock">

<div class="content">

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

</div>

</div>

<div class="ulist">

-   変換出力

</div>

<div class="paragraph">

インライン形式の式表示

</div>

<div class="paragraph">

インラインの式 \\$ \\int f(x)\\$ 記述

</div>

<div class="paragraph">

としたらLatex記法

</div>

<div class="paragraph">

改行形式にしたいときは

</div>

<div class="stemblock">

<div class="content">

\\\[\\sum_0^\\infty f(z) \\\\ \\int_0^\\infty
\\sqrt{2}\\dfrac{d}{dt}f(t)\\sin{\\theta(\\tau)}d\\tau\\\]

</div>

</div>

</div>

<div class="sect3">

#### 1.7 表をつくる

<div class="ulist">

-   基本

    <div class="olist arabic">

    1.  1行の始まりは\|とし、行終わりには\|をつけない。

    2.  最初の1行は改行を含めずに記述。

    </div>

</div>

<div class="listingblock">

<div class="content">

    |===
    | hoge | fuga | pon

    |a
    |v
    |c
    |===

</div>

</div>

| hoge | fuga | pon |
|------|------|-----|
| a    | v    | c   |

<div class="ulist">

-   cols属性が未指定のときは、最初の1行目のカラム数がテーブル列数

-   最初の行の後が空行のときは、最初の行はヘッダ行とみなされる。

-   以下の設定を\|===の前に指定する

    <div class="ulist">

    -   \[cols="2\*", options="header"\]  
        cols属性の\*は繰り返しを表す演算子である。この場合4つのカラム全てにデフォルトのフォーマットが適用されます。
        ヘッダー行が１行で定義されていない場合は、cols属性でカラム数を指定し、options属性を指定する必要があります。

    -   \[cols="1,1,2", options="header"\]  
        colsでこのように指定すると、カラム数は３で、それぞれの列幅が1:1:2になるように表示されます。

    </div>

-   CSVデータを使う

</div>

<div class="listingblock">

<div class="content">

    [format="csv", options="header"]
    |===
    アーティスト,トラック,ジャンル
    Baauer,Harlem Shake,Hip Hop
    The Lumineers,Ho Hey,Folk Rock
    |===

</div>

</div>

| アーティスト  | トラック     | ジャンル  |
|---------------|--------------|-----------|
| Baauer        | Harlem Shake | Hip Hop   |
| The Lumineers | Ho Hey       | Folk Rock |

<div class="ulist">

-   CSVデータ読み込み

</div>

<div class="listingblock">

<div class="content">

    [format="csv"]
    |===
    include::./hoge.csv[]
    |===

</div>

</div>

|     |     |     |
|-----|-----|-----|
| a   | b   | c   |
| s   | d   | e   |

<div class="ulist">

-   揃え記号

    <div class="ulist">

    -   \< ^ \>で、横方向の　左寄せ、中央、右寄せ

    -   dot(.)を前につける(.\< .^ .\>)と、縦方向の揃え

    -   n+でセル結合

    </div>

-   まとめて設定するときは、option部で指定

</div>

<div class="listingblock">

<div class="content">

    [cols="^,<,>"]
    |===
    |中央 |左 |右

    |center
    |left
    |right
    |===

</div>

</div>

| 中央   | 左   | 右    |
|--------|------|-------|
| center | left | right |

<div class="ulist">

-   \|の前に、揃え記号を記述すると、セルごとの揃え指定

</div>

<div class="listingblock">

<div class="content">

    |===
    <|左寄せ ^|中央 >|右

    2+^|2セル結合、中央寄せ
    <|ひだり
    |===

</div>

</div>

| 左寄せ              | 中央 | 右     |
|---------------------|------|--------|
| 2セル結合、中央寄せ |      | ひだり |

<div class="ulist">

-   こんなこともできます

</div>

<div class="paragraph">

[クイックリファレンス日本語訳,整形,セル結合から引用,一部改変](https://takumon.github.io/asciidoc-syntax-quick-reference-japanese-translation/#_整形_セル結合)

</div>

<div class="listingblock">

<div class="content">

    [cols="e,m,^,>s", width="25%"]
    |===
    |1 >s|2 |3 |4
    ^|5 2.2+^.^|6 .3+<.>m|7
    ^|8
    |9 2+>|10
    e|z s|a m|bbc ^|A
    |===

</div>

</div>

<div class="paragraph">

e:emphasis=italicized, s:strong=bold, m:monospace,

</div>

|     |       |       |       |
|-----|-------|-------|-------|
| *1* | **2** | 3     | **4** |
| *5* | `6`   |       | `7`   |
| *8* |       |       |       |
| *9* | `10`  |       |       |
| *z* | **a** | `bbc` | **A** |

</div>

<div class="sect3">

#### 1.8 ヘッダ, frontmatter

<div class="listingblock">

<div class="content">

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

</div>

</div>

<div class="paragraph">

lang指定がないとlang=enになるので、jaと指定したほうが平和かもしれません。

</div>

<div class="paragraph">

ヘッダ直後の1行が、メタタグのauthorに設定されるようです。

</div>

<div class="paragraph">

hugoで処理するなら、mdと同じ形式のfrontmatterが必要です。

</div>

<div class="listingblock">

<div class="content">

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

</div>

</div>

</div>

<div class="sect3">

#### 1.9 その他

<div class="ulist">

-   アトリビュート  
    ヘッダ部で宣言した名前:hoge:と
    中括弧{hoge}を置き換えしてくれるようです。  
    リビジョン{Revision}0.01  
    マイネーム{myname}HHH  
    ヘッダ直後の1行が、メタタグのauthorに設定されるようです。

-   スタイルにarticle(デフォルト)や bookがあるそうです  
    プリアンブルに :doctype: book 指定?  
    または変換オプション\`-d book\`指定

</div>

</div>

</div>

</div>

</div>

<div class="sect1">

## 2.変換出力

<div class="sectionbody">

<div class="sect2">

<a id="_2_1_環境構築"></a>

### 2.1 環境構築

<div class="olist arabic">

1.  asciidoc形式で書いた文書をhtmlに変換するために、asciidoctorをapt(synaptic)でinstall  
    asciidoctor: adocで書かれたコンテンツをHTML5,DocBook,PDFなどに変換

2.  asciidoc形式で書いた文書をpdfに変換するために、asciidoctor-pdfをgem(aptにはないので注意)で
    install  
    [asciidoctor-pdfはasciidoctorとpawnを用いてpdfに変換します](https://waku-take-a.github.io/asciidoctor-pdf%25E3%2581%25AB%25E3%2582%2588%25E3%2582%258BPDF%25E5%2587%25BA%25E5%258A%259B(%25E5%25B0%258E%25E5%2585%25A5).html)  
    gemはrubyのライブラリ

</div>

<div class="listingblock">

<div class="content">

    #apt install asciidoctor
    #gem install asciidoctor-pdf

</div>

</div>

</div>

<div class="sect2">

### 2.2 htmlに変換出力

<div class="listingblock">

<div class="content">

    $asciidoctor hoge.adoc

</div>

</div>

<div class="paragraph">

数式もきれいに展開できます。

</div>

</div>

<div class="sect2">

### 2.3 pdfに変換出力

<div class="paragraph">

オプションがないと、日本語文字が豆腐になります。

</div>

<div class="listingblock">

<div class="content">

    $asciidoctor-pdf  -a pdf-theme=default-with-fallback-font hoge.adoc

</div>

</div>

<div class="paragraph">

オプションは -a scripts=cjk
という紹介も有りましたが、私の環境では上記でした。

</div>

<div class="paragraph">

また、-a scripts=cjkと併用する紹介もありますが、効果はよくわかりません
(fontは同じでした)。
少なくとも、pdfサイズがかなり大きく(2倍近く)なりました。

</div>

<div class="paragraph">

[asciidoctor-pdfで日本語を含むPDFの出力を行う](https://qiita.com/mitsu48/items/34875bbc8ba00760fe27)

</div>

<div class="paragraph">

このオプションについての情報は
[ここのスレッドを参考にしてください。](https://github.com/asciidoctor/asciidoctor-pdf/issues/1472)
下の方にいろいろな設定も書いてあって遊べるかもしれません。

</div>

<div class="paragraph">

日本語フォントしょぼいという評判? ipaではない。

</div>

<div class="sect3">

#### pdf日本語font設定 thread

<div class="ulist">

-   [docker-asciidoctorを使う方法](https://blog1.mammb.com/entry/2021/09/22/090000)  
    default-thema.ymlを編集してhoge.ymlで保存  
    asciidoctor-pdf hoge.adoc -a pdf-style=hoge.yml  
    docker-asciidoctorとはまた別??  

-   [asciidoctor-pdfで日本語を含むPDFの出力を行う,2021年の情報](https://qiita.com/mitsu48/items/34875bbc8ba00760fe27)

-   [備忘録:
    asciidoctorでpdf作成を行うメモ(Ubuntu18)](https://qiita.com/syuuu/items/b86891536a2ae805465e)

</div>

</div>

<div class="sect3">

#### pdfに数式を出力したい時

<div class="listingblock">

<div class="content">

    $asciidoctor-pdf  -a pdf-theme=default-with-fallback-font -r asciidoctor-mathematical hoge.adoc

</div>

</div>

<div class="admonitionblock caution">

|     |                                                                                      |
|-----|--------------------------------------------------------------------------------------|
|     | <span class="red">式をpdf上に出力するにはasciidoctor-mathematicalが必要です。</span> |

</div>

<div class="paragraph">

数式出力環境構築:package install

</div>

<div class="literalblock">

<div class="content">

    apt install cmake
    apt install ruby-dev
    gem install asciidoctor-mathematical

</div>

</div>

<div class="admonitionblock note">

|     |                                                                                                                                                                                             |
|-----|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     | asciidoctor-mathematicalをgemしたら良いそうですが、 私の環境ではinstallエラーになりました。 include pathを修正したら良さそうなのですが、ソースの修正が必要? かもしれないので、pendingです。 |

</div>

</div>

</div>

</div>

</div>

<div class="sect1">

## HUGO

<div class="sectionbody">

<div class="paragraph">

Hugoで管理すると、githubでの公開展開が楽になるそうです。

</div>

<div class="paragraph">

Hugoをaptしたら、gitも入りました。

</div>

<div class="paragraph">

[Hugo + AsciidocでGitHub Pages上にブログを公開するまで
その1](https://deankh.github.io/blog/posts/dwjnjn8tbf/)

</div>

<div class="paragraph">

以下のことが現状です。

</div>

<div class="ulist">

-   frontmatterは、mdと同じ形式で記述することが必要です。
    書かないtitleなどが表示されません。

-   文字の色つけができていません。

-   cautionなどをアイコン表示することができていません。

-   github-actionsを用いてhtmlを自動生成する際は、いろいろ知識が必要とな
    るようです。

</div>

</div>

</div>

<div class="sect1">

## その他

<div class="sectionbody">

<div class="paragraph">

bundlerとはgemを管理するためのツールで
複数のgemの依存関係を保ちながらgemの管理ができます。

</div>

<div class="paragraph">

gem install bundler

</div>

</div>

</div>

<div class="sect1">

## 感想

<div class="sectionbody">

<div class="paragraph">

org-modeとAsciidocの比較感想です

</div>

<div class="ulist">

-   Asciidocは <span class="big green">凝った</span>
    html出力を簡単に作成できる。html出力を主眼。

-   org-modeはスケジュールやTodo管理、文章構成検討(foldして章ごと移動できる)が簡単。とにかく書くことが目的ならorg。

-   TeX出力ならorg-modeの方が扱いやすそう  
    \# そもそも、AsciidocはTeX使いたくない人向け??  
    \# Org-asciidocてなものもある
    <a href="https://github.com/yashi/org-asciidoc"
    class="bare">https://github.com/yashi/org-asciidoc</a>

-   include文が使えるので、とっても見やすく文書が作成できる。

-   Asciidocの文書をhugo/github-actionsで処理して公開する場合は、もう少し知識が必要なようです。
    include使うときは特に…​

</div>

</div>

</div>

</div>

<div id="footnotes">

------------------------------------------------------------------------

<div id="_footnotedef_1" class="footnote">

[1](#_footnoteref_1). ここの内容が脚注になり一番下に表示されます

</div>

</div>
