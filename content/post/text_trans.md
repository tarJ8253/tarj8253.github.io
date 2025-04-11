---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "markup text trans." # Title of the blog post.
date: 2025-04-10T13:05:46+09:00 # Date of post creation.
description: "pandoc linux" # Description used for search engine.
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
  - tool
tags:
  - pandoc
  - Emacs
#series :
#  - Enjoy Linux
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:
# comment: false # Disable comment if false.
lang: ja
---

# マークアップ形式テキストの変換

いろいろなマークアップ形式で書かれたテキストを、
目的に応じたテキストに変換するためのメモ

<!--more-->

## md(markdown)形式で書かれたテキスト

### スライドを作成する

-   visual studio codeを用いる場合

    おなじみmarpを使い、frontmatterに以下を追加するだけ

``` example
---
marp: true
theme: gaia
size: 16:9
---
```

ここで作成したpptファイルはpptから編集できないそうですが、
cl版のmarpを使えば編集できるそうです。

-   pandocを用いる場合

(1)ppt形式に落とす

``` bash
pandoc -f markdown -t pptx -o hogeFUGA.pptx src.md 
```

以下のoption使うとpptのテンプレートに落とせるそうですが、
テンプレートに仕掛けがいるようなので未検証です。

``` example
--reference-doc=template.pptx
```

(2)beamer形式:一旦texに落としてから、ブリアンブル編集してcompileする方が平和のようです。

``` bash
pandoc -f markdown -t beamer -o hogeFUGA.tex src.md 
```

pdflatex用に書いた英文のみの原稿なら、直接出力できるかもしれません。

以下のように紹介しているサイトもあるようですが、私の場合ではErrorになり直接出力できませんでした。

``` bash
pandoc -f markdown -t beamer -o hogeP.pdf src.md --pdf-engine=lualatex -V documentclass=jlreq
```

Emacs上では、htmlにexportできます。

## org形式で書かれたテキスト

### md形式に変更 github-actionsで用いるため

Emacsからexportします。

-   方法1::
    Hugo/github-actionsで用いるため、ox-pandoc(Emacs)経由でgfm形式として出力するのが平和!  

src Rが \`\`\`rとなり、プログラム言語として表記。frontmatterがつく

アンダーバーや大小の記号にはバックスラッシュが付けられる

-   方法2:: Hugo-compatible-markdownでexport\\\\
    frontmatterに#+HUGO_BASE_DIR: ./の指定必要

セクションヘッドにlinkがつけられる。  
セクション記号のアスタリスクが1つずつ増える(セクションレベル下がる)。  
example環境がtext環境として出力される  
\<!–list-end–\>のタグが入る。

-   emacs:gfmでexportすると Rとなるが、frontmatterなし
-   Emacs:markdownとしてexportしたら(ox-md?)、src環境が、\`\`\`もなく、全てpre環境になり、言語指定も落ちる
-   pandocで直接変換(comamnd line)したら、begin_src
    rとしている言語指定(r)の変換が \`\`\`{.r org-language="R"}となる。
    man
    pandocすると、rと{.r}は等価,fenced_code_attributesと紹介とされているが、hugoでhtml表示した時、単なる\<pre\>となり、言語指定外れる。

### スライドを作成する

-   EmacsのexportでLatex/Beamer形式で出力  

exportされたファイルのコンパイルオプションを変更。(pdfLaTeX用で出力されているため)  
必要なpackage追加や必要な修正加筆を行って、コンパイル

-   pandocを使って出力先にpptxとしたらできると思いますが未検証

## html形式で書かれたテキスト

### md形式に変更する

昔htmlタグを用いて作成したファイルをHugo/Githubで用いるためにmdに変換する。

-   方法1:: pandoc -t
    markdownで出力。gfmはidタグ落ちるので不適,m\*{\_strict\|mmd}も不適
-   方法2::
    言語ソースを指定したいときはorgに一旦変換して、必要な編集を加筆実行。

preタグはexampleになっているので、src
hogeと変更する。その後orgを上記Emacs:pandoc/gfmで出力。

## asciidoc形式で書かれたテキスト

includeを使えるので、とっても便利なのですが、github/actionsでweb表示するには
いろいろ知識が必要なようです。

asciidoctorでhtmlにしてから、mdにするとき以下の点に留意。

asciidocでリンク先にセクションを使用していると、
pandocで変換時にリンクタグのアンダーバーのせいでおかしくなるようです。
(cssがないため?)

### md形式に変更する

-   orgに一旦変換する。
    custom_idとなっているタグが、mdに反映されない場合有り。
    タグからアンダーバーと数字を全て削除し、

    ``` example
    <<tag>>
    ```

    の形式で適当な箇所に手動追加。custom_idのpropertyブロックも削除。
    exampleをsrcなどに加筆修正。

その後、Emacs-pandoc-gfmとして変換。

-   markdownで出力すると、md-html変換後ではリンク先は、id=sec2-\_sec2、リンク元は_sec2などとなり不一致。また、idタグが表示されてしまいブサイク。

-   gfmは不適。link落ちて、srcはhighlightになる。

## 変換スクリプト

``` bash
#! /bin/bash

ext="html"
fn=$(ls *$ext)
ext_o="md"
o_type="org"
o_type="markdown"
o_type="gfm"

for d in $fn ; do
echo $d
##pandoc $d -f $ext -t $o_type -o ${d%$ext}$ext_o
#pandoc ${d%$ext}$ext_o　-f $o_type -t $ext  -o $d$ext_o$ext
#変換後htmlに再変換して修正確認するために、拡張子htmlは残す
#-sにすると、md用のfrontmatter追加してくれる
pandoc -s $d -t $o_type -o ${d}.$ext_o
pandoc ${d}.$ext_o -f $o_type -t $ext -o $d.$ext
done
```
