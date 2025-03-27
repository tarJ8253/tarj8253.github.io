---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "pdfファイルを編修" # Title of the blog post.
date: 2025-03-04T15:46:46+09:00 # Date of post creation.
description: "Article description." # Description used for search engine.
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
  - tool
tags:
  - pdftk
  - qpdf
#series :
#  - Enjoy Linux
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:

# comment: false # Disable comment if false.

lang: ja
#2023.10.10,gsの項修正\
#2014.1.6 初稿
---

<!--# pdfファイルを編修-->




pdfファイルに以下の処理を行いたいときのtips

- [分割、複数ファイルのまとめ](#pdftk)
- [パスワード解除](#qpdf)
- [ページをまとめる](#nup)
- [fontの埋め込み](#fontenbed)
- [ファイルサイズ縮小](#sizedec)

<!--more-->

## <a id= "pdftk">pdfファイルを分割したり、まとめたりする</a>

pdftk というコマンドがあります(要apt-get install)。\
これを使った、pdfchainというGUIもあるようですが、コマンドだけで不自由ないようです。

-   複数ファイルを一つにまとめる。

        pdftk a.pdf b.pdf cat output ab.pdf

    a.pdfとb.pdfをまとめてab.pdfを作成します。
    

-   ページを抜き取る。残すページを指定します。

        pdftk a.pdf cat 1-3 6 output hoge.pdf

    a.pdfの中から、1,2,3,6ページを使って、hoge.pdfを作成します。
    

-   1ページ毎のpdfファイルにする。

        pdftk  hoge.pdf burst  output h%02d.pdf

    hoge.pdfが元ファイル。hが分割したファイルの新しい共通名で、
    %02dが数字の入る部分です。h01.pdf,h02.pdf,\...ができます。

-   ページを回転する。

         pdftk hoge.pdf cat 1-endL output fuga.pdf

    1-endで全ページの指定。\
    方向は

        N: 0, E: 90, S: 180, W: 270, L: -90, R: +90, D: +180.

    L,R,Dは相対方向の指定です。\
	pdftkのバージョンにより、
    north,east,south,west,left,right,downtと指定する場合もあるそうです。




こちらもどうぞ [LinuxでPDFファイルを分割／結合するには＠IT](http://www.atmarkit.co.jp/flinux/rensai/linuxtips/928splitpdf.html)

## <a id= "qpdf">pdfのpwを解除する。</a>

	
    qdfを使いました。

        qpdf --password=passwd --decrypt input.pdf output.pdf

    
    またはevinceで開いて、印刷、ファイル出力を選択。

 多くのwebに下記のように書かれていましたが、解除出来ないこともありました。

	    pdftk iuput.pdf input_pw passwd output output.pdf

### <a id= "nup">複数ページを1ページにまとめる。</a>

pdfnupというコマンドがあります。スライドの一覧を作るとき便利です。\
印刷時のオプションでもできますが、予めまとめておけば便利です。\
pdfjam経由でpdflatexを呼んでいるようです。pdfだけでなく、pngやjpgも扱えるようです。

-   pdfnup \--nup
    まとめ方　用紙の向き　ファイル名　で　ファイル名-nupができます。

         pdfnup --nup '2x2'  hoge.pdf

    とすると、1ページ4枚、横置きのhoge-nup.pdfができます。

         pdfnup --nup '2x4' --no-landscape hoge.pdf

    とすると、1ページ8枚、縦置きのhoge-nup.pdfができます。
    
    ただしA4上下左右の余白がなくなるので印刷時に欠けてしまいます。少し縮小したほうが良いようです。

         pdfnup --scale 0.96 --nup '2x4' --no-landscape hoge.pdf

    
    
    他のオプションとして

        --delta '10mm 10mm'

    を付け加えると、ページ間の余白は空きますが、上下の余白は空かないようです。

お好みでどうぞ。

## <a id= "fontenbed">fontを埋め込む</a>

注:最近のTeXLive(2023?)でLuaLaTeXを用いる場合は、原の味font埋め込みがdefaultのようです。

注:TeXLive2022の変更で、 非埋め込みの、GothicBBB-Medium-Identity-H,
Ryumin-Light-Identity-H が全部化けました。\
fontを全部埋め込んでからgsにかければ平和です。

fontの埋め込みは

    $kanji-config-updmap ipaex -user(埋め込む)
    $kanji-config-updmap nofont -user(埋め込まない)

文字コードによってはフォント埋め込みが豆腐になります。

そのときはプリアンブルに以下を追記

- \\usepackage\[jis2004\]{otf}%処理系がplatexの場合
- \\usepackage\[jis2004,uplatex\]{otf}%処理系がuplatexの場合


\[debian-users 00949\] Re:
dvipdfmxでipaフォントを指定するとJIS2004改正文字が表示されない

## <a id= "sizedec">pdfのファイルサイズを小さくする</a>

pdfファイルのサイズ制限がある場合に用います。

-   gsを使う

    
    gsのおまじない

        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf

    PDFSETTINGSの設定で出来上がりサイズいろいろ変わります。
    ebookとかprepressとかあるようです(引用元:https://gist.github.com/firstdoit/6390547)

      -dPDFSETTINGS= 
    |--|---|
    |  /screen|          低解像度:DistillerのScreen Optimized|
  |    /ebook |           中解像度:DistillerのeBook|
  |    /printer |         DistillerのPrint Optimized|
  |    /prepress |       DistillerのPrepress Optimized|
|      /default   | |

    
    時間はむちゃくちゃかかるかもしれません。

-   ps2pdfを使う

    2023.9,gs(on bookworm)を使うと、日本語が全部変な漢字になりました。
    (TeXlive2022,CIDfontmapの変更?::fontを埋め込みにすると解決します)
	
    pdf2psしたあと、ps2pdfしました。

        pdf2ps input.pdf output.ps
        ps2pdf -dPDFSETTINGS=/printer output.ps output.pdf

