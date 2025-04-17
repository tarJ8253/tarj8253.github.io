---
#content/post/以外に置くファイルのfrontmatter
#---はyamlの書式.+++はtoml
title: "VisualStudioCodeの始め方" # Title of the blog post.
date: 2025-02-21T14:59:04+09:00 # Date of post creation.
description: "VSC,markdown,slide" # Description used for search engine.
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
  - vsc
  - markdown
#series :
#  - tools
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:

# comment: false # Disable comment if false.

---


# VisualStudio Code+MarkDownでレポート、スライドをさくっと作成


## 1. はじめに

ここは章、ここは箇条書き、太字、などをテキスト上で指示しながら
サクッと、文書を書いてレポート提出したりスライド作成する方法の紹介。

<mark>**文書推敲に集中できます。**</mark>

Markdownと呼ばれる形式で文書を作成します。

<!--more-->

有料/無料のいろいろな組み合わせがありますが、ここではすべて無料の
Visual Studio Codeとその拡張機能(プラグインソフト)を用いた変換を紹介します。

## 2. VisualStudioCode をインストールする

テキストを入力するエディタは何でもいいのですが、html,pdf,スライド形式
などに変換出力することが必要なので、そのオプションを無料で使えるVScodeを使います。

他の方法としてはEmacsを使う方式があります。


## マークダウンの命令(方言)に注意

とっても便利なマークダウンなので、様々な変換ソフト(変換機能アプリ)
が乱立し、正式な文法が定まっていません。
たとえば、「引用」ができたりできなかったりします。



## 3. VScodeの起動

![](./figs/vs-start.png)

### VScodeの設定を変更する

net接続必須(Configのメニューにinstall可能言語表示されない)

NETに接続していないとメニューが現れないので、注意

### 日本語メニューにする

View -> Command Palette -> Configure display language -> 日本語

1. ViewからCommand Paletetを選択

![](./figs/config/start-2-r.png)

2. Configure Lnguageを選択

![](./figs/config/config-2-r.png)

3. 日本語を選択

![](./figs/config/jp-sel-r.png)

4. 再起動していいか尋ねられているので、Restart(ok)とする

![](./figs/config/config-y-r.png)

### 見栄えの変更

ファイル -> ユーザー設定テーマ -> 配色テーマ

File -> Preference -> Theme -> Color Theme

背景がお好みでない人は以下で変更できます。

1. FileからPreference,Theme,Color Themeを選択

![](./figs/config/theme-r.png)

2. お好みのテーマを選んでクリック

![](./figs/config/theme-sel-r.png)

## 5. 拡張機能をインストール

Markup形式で書かれた文書をhtml,pdf,スライド形式に変換するために
以下の拡張機能をインストールします。

なお、PCをNetworkに接続しないと候補が
メニューで現れないので、注意!

- Markdown PDF
- Marp for VS Code

markdown all in oneのインストールもよく紹介されていますが、
入力支援に用いるものなので、ここでは割愛します。



### PDF変換機能: Markdown PDF をinstall

1. 拡張機能ボタンを押す

![](./figs/extension/ext-1-r.png)

2. 検索画面にmarkdownと入力すると、該当するものが表示される。

![](./figs/extension/ext-2-r.png)

3. Markdown PDFをクリックしてインストール

![](./figs/extension/md-pdf-r.png)

4. trust画面が表示されたら、信用するので、Trust & Install

![](./figs/extension/trust-1-r.png)

### Slide出力機能: Marp for VS Codeをinstall

1. 検索画面にmarpと入力して、現れた、
Marp for VS Codeをクリックして、インストール

![](./figs/extension/marp-r.png)

**MARPをinstallしたら、環境変数を有効にするために、PCを再起動してください**


## TRUSTがでてもokにする

作業場所(フォルダ)がwindowsがわからない場所だと、以下のダイアログがでます。

windowsが管理している場所だと
勝手にファイルを弄ぶことがあるので、
私は管理が及ばない場所で作業しています。
とりあえず、okにしておきます。

![](./figs/trust-2.png)


## 文書を書く

マークアップ形式で文書を書きます。

[マークダウンの書式は別ページを参考してください](/post/markdown_howto)。

改行や空白行が半角空白などが大きな意味をもつので、慣れるまで注意してく
ださい。

1. File -> New Text Fileを選択

![](./figs/textwright/newtext-1-r.png)

2. 入力画面になったので、適当に作成してください。


![](./figs/textwright/newtext-2-r.png)


3. 以下を適当に入力しました。


```
# はじめに
## 本日は晴天なり

- 今日は晴れた
- 明日ははれるかな?

### あああ
```

シャープ記号やハイフンはmarkdownの書式です。

記号+半角スペース(半角空白文字)が必ず必要です。


![](./figs/textwright/text-1-r.png)

## 文書を保存

1. 文書を保存します。 

File -> save

![](./figs/save/save.png)

2. 保存ダイアログ画面が開きます。

ファイル名に、文書の1行目が入っています。
(MSのお節介のせいです)

また、ファイルの種類がMarkdownとなり、ファイル拡張子がmdとなっています。

ファイル名に日本語、空白文字、記号などがあると、unHappyになることがある
ので、英文字名に変更します。

![](./figs/save/save-2-r.png)

3. start1.mdと変更しました。

![](./figs/save/save-3-r.png)


**必ず拡張子をmdにしてください!!**

お節介焼きのMSは、拡張子がmd(markdown)としないと、働いてくれません!!


## html形式で表示

htmlに変換して表示させます。

1. 右上にある、Open Previewのアイコンを押します

![](./figs/html/preview-1-r.png)

2. 画面が分割され、右画面に、htmlの形式で表示されました。

![](./figs/html/preview-2-r.png)

3. 左画面で、編集を続けると、自動的に右画面に反映されていきます。


![](./figs/html/preview-3-r.png)


## pdf形式で保存

1. pdf形式でファイル保存するときは、画面上で右クリックを押して、
コンテキストメニューを出し、Markdown PDF: Export(pdf)を選択します。

![](./figs/pdf/pdf-out-r.png)

<!--
![](./figs/export-menu.png)
-->


2.左下に、保存場所が表示されています。htmlも同様です

![](./figs/pdf/pdf-out-2-r.png)


3. pdf文書が表示されます。

![](./figs/pdf/start1.pdf.png)


ファイルがあることがわかります。

![](./figs/pdf/save-res-r.png)




## スライド形式で出力する

marpを使います。


1. 文頭(frontmatterといいます)にスライドにするための以下の5行のおまじないを書きます。

```
---
marp: true
theme: gaia
size: 16:9
---
```

- ハイフンは3つ必要です。
- :の後の半角スペースが必要
- theme:の行はないと、背景が白になります。
- size:は縦横比です。


すると、右画面が以下のように変化します。

![](./figs/marp/marp-1-r.png)

環境変数を有効にすることが必要なので、
marpインストール後再起動していない場合は、再起動してください。

### スライドをファイル出力保存します。

<!--
![](./figs/newslide.png)
-->

1. Marpのアイコンをクリックします


![](./figs/marp/mm2-r.png)


2. Export Slide Deckを選択します。

![](./figs/marp/mm2-1-r.png)

3. スライドとしての保存名を入力します。先程pdfファイルを保存したので、別名にしま
す。

![](./figs/marp/mm2-3-r.png)

5. 保存結果が表示されました




![](./figs/marp/mm2-4.png)

<!--
![](./figs/marp/marp-slide-fin-show.png)

![](./figs/marp/marp-sl.png)

![](./figs/marp/marp-slide-fin.png)

![](./figs/marp/marp-slide-save.png)

![](./figs/marp/marp-slide-save-2.png)

![](./figs/marp/marp-slide-save-3.png)
 -->


保存場所にもファイルがあります

![](./figs/marp/marp-sl-f.png)

6. 新しいスライドに書くときは、ハイフン3つで区切ります。

![](./figs/marp/newslide-2-r.png)

3.新しいスライドが表示されています。

画像も自由に取り込むことができます。

![](./figs/marp/marp-end-2.png)


---------------

作業を簡略化して結果を早く提示する方法を紹介しました。

簡単にさくっと文書を書いてレポートやスライドにすることが目的なので、
書式を重んじる場合はそれなりの方法で作成してください。

今回はVScodeとその拡張機能を用いたmarkdownを紹介しました。
変換機能により、Markdownの書式(方言)が乱立していますので、
注意して使用してください。
