---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
description: "LuaLaTeX, platex" # Description used for search engine.
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
title: "pLaTeXからLuaLaTeXへ"
date: 2025-03-03T11:27:08+09:00
# aliases:
categories:
 - document write
tags:
 - TeX
 - LuaLaTeX
#series:
# - Enjoy Linux
#comments: false
#keywords:
isCJKLanguage: true
#初版:2024.9.9(S99.9.9)
#:nofooter:
#:lang: ja
#:Date: 2024.9.9
#:Revision: 0.0
#:myname: who
---
<div id="header" markdown="1">

# pLaTeXからLuaLaTeXへ

<div class="details" markdown="1">

<span id="author" class="author">\#初版:2024.9.9(S99.9.9)</span>  

</div>

</div>

<div id="content" markdown="1">

<div id="preamble" markdown="1">

<div class="sectionbody" markdown="1">

<div class="paragraph" markdown="1">

久々に美文書9版(2023.12)を見たら、8版からLuaLaTeXに移行。世間もLuaに…​

</div>

<div class="paragraph" markdown="1">

これからの文書はLuaの方が良いようです。

</div>

<div class="paragraph" markdown="1">

変更点

</div>

<div class="ulist" markdown="1">

-   pdfまで出力。すべてのfontが埋め込まれる。

-   fontがIPAexから原ノ味(Adobeの源ノ明朝+源ノゴシックを再編成したもの)  
    味はadobe japan 1のもじりらしい(美文書9版p.240)

-   クラスファイルはjlreqがおすすめ。

-   zwは\\zwへ

-   \\bfは\\textbfへ。 \\mathbfもあり

</div>

</div>

</div>

<div class="sect1" markdown="1">

## Template

<div class="sectionbody" markdown="1">

<div class="listingblock" markdown="1">

<div class="content" markdown="1">

``` highlight
%#! lualatex -synctex=1 lua_template.tex
\documentclass[fontsize=24pt,jafontscale=0.9247,paper=a0paper]{jlreq}
%\usepackage[left=20.4truemm,top=20.4truemm,right=20truemm,bottom=20truemm]{geometry}%余白指定したい時
\usepackage{graphicx}%option dvipdfmxは不要(記述厳禁)
\usepackage{unicode-math}%amsmathの代わり,amssymbも不要
\usepackage{color}

\def\bm#1{\symbfit{#1}}
\def\theenumii{\arabic{enumii}}%enumerateiiを数字にする
\def\theenumiii{(\alph{enumiii})}%enumerateiiiを(a)にする

\begin{document}

\section{サンプル}

\begin{align}
&\dot{x}(t)=\bm{Ax}(t)+\bm{bu}(t) \\
&\bm{A}=
 \begin{pmatrix}
 a & b\\
c& d
 \end{pmatrix}\label{eq:amat}\\
&y=\bm{cx}(t)
\end{align}

式(\ref{eq:amat})で示す$\bm{A}$は正定行列である。

\section{fugo}

図\ref{fig:ff}は実験hogeの結果を示す。

\begin{figure}[h]
\centering

\includegraphics[width=0.3\textwidth]{hoge.pdf} 
\caption{hogehoge}\label{fig:ff}
\end{figure}%
%空白出力抑制のため、end{figure}の後ろに%をつけましょう

\begin{figure}[h]

\hfill
\begin{minipage}{0.47\textwidth}

\includegraphics[width=\textwidth]{hoge.pdf} 
 
\end{minipage}
\hfill
\begin{minipage}{0.47\textwidth}

\includegraphics[width=\textwidth]{hoge.pdf} 
 
\end{minipage}
\hfill~

\end{figure}

\end{document}
```

</div>

</div>

</div>

</div>

<div class="sect1" markdown="1">

## documentclassはjlreqを使う

<div class="sectionbody" markdown="1">

<div class="ulist" markdown="1">

-   jlreqはarticle相当。option指定でreport, book

-   紙サイズはpaper=a5paper,b5jオプションで指定

-   文字サイズ指定は英日別可,fontsize=12pt,jafontscale=0.9247など  
    デフォルトは10pt,1。

-   j(s){article,report,book}はobsoleteにする。

-   jlreqでは、center環境の前後半行分の空白はなくなった。

</div>

<div class="listingblock" markdown="1">

<div class="title" markdown="1">

サンプル

</div>

<div class="content" markdown="1">

    \documentclass[fontsize=12pt,jafontscale=0.9247,report,paper=b5j]{jlreq}%report,JIS B5判

</div>

</div>

</div>

</div>

<div class="sect1" markdown="1">

## 数式パッケージはunicode-math

<div class="sectionbody" markdown="1">

<div class="ulist" markdown="1">

-   amsmath,amssymbは不要。どうしても読み込みたい場合は、
    unicode-mathの前にinclude。

-   フォント周りもunicode-mathでok, txfontsはレガシー。

-   unicode-mathを読み込まないならlmodernを読み込む。これでフォントはLatinModernになる。

-   全部のギリシャ文字をイタリックにしたいときは(p.84)  
    usepackage\[math-style=ISO,bold-style=ISO\]{unicode-math}  
    \\symup{}, \\symit{}で立体とイタリック体個別に切替られる。  
    これまでの、varepsilon,vardeltaは有効

-   数式環境はalign(unicode-math必要)を使用。 equationは不完全。

-   \\bm{}は使えませんでした。\\usepackage{bm}して\\bm{}すると文字消えました。  
    \\bmを\\symbfitにします。追加packageは不要。unicode-mathだけです。

</div>

<div class="listingblock" markdown="1">

<div class="title" markdown="1">

面倒くさいときは

</div>

<div class="content" markdown="1">

    \def\bm#1{\symbfit{#1}}

</div>

</div>

<div class="ulist" markdown="1">

-   lualatexで問題出たら、lualatex-mathを読み込めば解決するかも

</div>

<div class="sect2" markdown="1">

### 数式の新しい知識

<div class="ulist" markdown="1">

-   数式中に文書いれる時は\\intertext{日本語}

-   数式中の改ページは \\displaybreak\[0\]で可能

-   txfontsは newtx, newpx,
    に新しくなったけど、レガシーだから使わないほうがいい??  
    両方とも未実装だった。newtxtext,newtxmathも未実装だった。

</div>

</div>

</div>

</div>

<div class="sect1" markdown="1">

## 図は、pdf,png,jpgでinclude。

<div class="sectionbody" markdown="1">

<div class="ulist" markdown="1">

-   inkscapeでpdfに保存するときは、保存時の出力ページオプションで、「エクスポートオブジェクトのサイズを使用」をcheck

-   pdfに出力するのでepsにする必要はない。

-   p.126: inkscapeにはpdf+latexという保存方法があり…​と書かれているが  
    inkscape1.2には未実装?

</div>

</div>

</div>

<div class="sect1" markdown="1">

## Presentation, beamerを使う

<div class="sectionbody" markdown="1">

<div class="paragraph" markdown="1">

テンプレートは以下

</div>

<div class="listingblock" markdown="1">

<div class="content" markdown="1">

    %#! lualatex -synctex=1 lua_beamer_template.tex
    \documentclass[aspectratio=169]{beamer}
    %\documentclass[fontsize=24pt,jafontscale=0.9247,aspectratio=169]{beamer}%fontsize指定は効かない

    \usepackage[no-math,deluxe]{luatexja-preset}%美文書
    %\usepackage{luatexja}%beamerでは漢字表記に必要。
    \renewcommand{\kanjifamilydefault}{\gtdefault}%太字にする
    \renewcommand{\emph}[1]{{\upshape\beseries #1}}


    \usetheme{CambridgeUS}
    %\setbeamertemplate{footline}[default]%フッタ表示なし
    \setbeamertemplate{footline}[framenumber]%フッタにページだけ表示
    \setbeamertemplate{headline}[default]%ヘッダなし
    \setbeamertemplate{navigation symbols}{}%ナビゲーションバーを表示しない

    \usepackage{graphicx}%option dvipdfmxは不要(記述厳禁)
    \usepackage{unicode-math}%amsmathの代わり,amssymbも不要
    \usepackage{color}

    \def\theenumii{\arabic{enumii}}%enumerateiiを数字にする
    \def\theenumiii{(\alph{enumiii})}%enumerateiiiを(a)にする

    \begin{document}


    \begin{frame}
    \frametitle{タイトル}
    \framesubtitle{サブタイトル}

     \begin{minipage}{0.47\textwidth}
    minipageで  
     \end{minipage}
     \begin{minipage}{0.47\textwidth}
      左右に分割するより
     \end{minipage}

    \begin{columns}
     \begin{column}{0.47\textwidth}

    column(s)
      
     \end{column}
     \begin{column}{0.47\textwidth}
      
    で分けたほうが簡単とのことです(why?)


     \end{column}
    \end{columns}



    \end{frame}

    \end{document}

</div>

</div>

<div class="paragraph" markdown="1">

powerdotはdvips経由なので、luaでは動かないようです。

</div>

</div>

</div>

<div class="sect1" markdown="1">

## 新しい知識

<div class="sectionbody" markdown="1">

<div class="ulist" markdown="1">

-   温度記号のcelsiusは\\textcelsius,
    mathcomp読み込むと\$20\\,\\tccelsius\$。

-   figure環境は\\end{figure}%と最後に%をつけて、空白出力抑制

-   \\hrulefill、\\dotfill で横線描画

-   ルビは \\usepackage{luatexja-ruby}使用。pxrubricaより強力

</div>

<div class="listingblock" markdown="1">

<div class="content" markdown="1">

    \ruby{尤度}{ゆう|ど}は\ruby{犬}{いぬ}度ではない%pxruburica
    \ruby{薬|缶}{や|かん}%p.247,luatexja-ruby

</div>

</div>

<div class="ulist" markdown="1">

-   fontの埋め込みchk

</div>

<div class="listingblock" markdown="1">

<div class="content" markdown="1">

    pdffonts hoge

</div>

</div>

<div class="ulist" markdown="1">

-   ドキュメント表示

</div>

<div class="listingblock" markdown="1">

<div class="content" markdown="1">

    texdoc jlreq
    texdoc -l texlive

</div>

</div>

<div class="paragraph" markdown="1">

-lはあいまい検索。候補表示

</div>

</div>

</div>

<div class="sect1" markdown="1">

## 文書は内容、構成、レイアウトを分けて作成する。

<div class="sectionbody" markdown="1">

<div class="paragraph" markdown="1">

wysiwyg(what you see is what you
get)では、どうしてもレイアウトに視点が行ってしまう。
overleafでも免れない。

</div>

<div class="paragraph" markdown="1">

とにかくwordはおせっかいなので、文書校正しているのにレイアウト色々勝手に
変更してくるので、集中の妨げになります。
おまけにレイアウト設定(変更)方法を知らないと文書ができないなんて変です。
マークアップ方式を普及させましょう。

</div>

<div class="paragraph" markdown="1">

以下大いに同意です。

</div>

<div class="paragraph" markdown="1">

[【雑談】MS
Wordは文書作成ソフトではないのでは……という話](https://lualatexlab.blog.fc2.com/blog-entry-82.html)

</div>

<div class="paragraph" markdown="1">

LaTeXで文書を作成していると、内容（本文）と構成（章立て）とソースコー
ド（プログラミング）と紙面レイアウト（デザイン）をそれぞれ整理する必要
があります。この4要素を一度に整理することはほとんど不可能で、LaTeXコー
ドと向き合うときはこのどれに集中しているのかを意識する必要があります。
これは一見して不便なようですが、意識すれば分けられるというのは、むしろ
嬉しい要素です。

</div>

</div>

</div>

</div>
