---
#content/post/に置くファイルの雛形!
#---はyamlの書式.+++はtoml
title: "Linux tips" # Title of the blog post.
date: 2025-02-22T01:08:48+09:00 # Date of post creation.
description: "Linux,find,diff" # Description used for search engine.
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
  - linux tips
tags:
  - find
  - diff
#series :
#  - Enjoy Linux
#aliases : 
#  - migrate-from-jekyl
# Create redirects from old URLs to new URLs with aliases:

# comment: false # Disable comment if false.
---

<!--# Linux TIPS -->

個人的備忘録です。


<!--more-->



## 実行時間の計測(gcc, icc ,ifc)

-   -pg をつけてcompile,linkして実行\
    <font color='red'>CFLAGS,FFLAGS,LDFLAGS全てに -pg をつけること!!</font>
-   プログラムを実行して終了すると、gmon.outができる
-   gprof ./prog-name gmon.out　として
    プログラムとgmon.outからさまざまなものを計算される
-   このときは画面に流れるだけなので \> としてリダイレクトしてファイル
    に落とす

## profile を使った最適化 (intel)

for-ug_lnx.htm/optimizations/Profile-guided Optimizations

-   -prof_gen をつけてcompileして実行\
    ifc -prof_gen hoge.f a.out
-   プログラムを実行して終了すると、\*\*\*\*.dynができる
    \*\*\*は16進random
-   ifc -prof_use -options hoge.f　として pgopti.dpiが出来上がる
    これをfeedbackする

## logout しても実行

-   nohup hoge & とするとhogeが実行\
    logout 後はプロセスとして実行するそうです。\
    &をつけてバックグランドに放り込んだほうがよいそうです。

## コンソール画面をファイルへ出力

-   hoge \> fuga.txt 2\>&1
-   hoge 2\>&1 \| tee fuga.txt
-   2が標準エラー出力、1が標準出力

## atコマンドの使いかた

-   at 10:20 Nov 11
-   \> /sbin/hogefuga
-   Ctrl-D で抜ける
-   /var/lib/spool/at にあり

atqで確認できる

### atコマンドで予定を知らせる!!!

ポカよけに予定の時間が来たら、スクリーン上になにか表示するようにします。

1.  atでスクリプトファイル指定

        $ at "16:00" -f /home/user/hoge/fuga.sh

    時間の表記は\
    \"10:50 日.月.西暦(下二桁)\"\
    (\"10:50 01.04.17\")とか\
    10:50 Apr 1\
    とするそうです。\
    \
    \"10:30 20200311\" (2020年3月11日)でもok\
    \
    fuga.shの中身は

        #!/bin/bash
        DISPLAY=:0.0 \
        eog /home/user/hoge/hoge.jpg

    eog(eye of gnome)でpngなりjpgのファイルを表示します。\
    実行可能ファイルならなんでもokのようです。\
    <font color='red'>DISPLAYの最後のバックスラッシュ必須です。</font>\
    一行にしないとダメなのでしょう。
    

2.  端末上からechoをatに食わせる

        echo 'DISPLAY=:0.0 /home/user/hore.sh' | at now+1minute

    hore.shの中身は上と同じです(DISPLAY無くても大丈夫です)
    

notify-send(libnotify-bin install)を用いてもできるようですが、
今の環境(wheezy/gnome)では、表示アイコンが沈んでしまうので、使いませんでした。

## diffのオプション

-   Nar{uc}=Newfile,text,recursive,output num
    line{unified,copied}context
-   ディレクトリ内ファイルの比較\
    diff -r FROM_DIR TARGET_DIR\
    diff -qr FROM_DIR TARGET_DIR
-   ディレクトリ以下全パッチ(ファイル名書かんでも済む!!)\
    diff -cr FROM_DIR TARGET_DIR \> PATCH
-   ディレクトリ以下全パッチ,
    一方にしか存在しないファイルも対象にする時
    diff -crN FROM_DIR TARGET_DIR \> PATCH

## bashでのパターン照合

hogeに文字列が設定されているとする

-   \${hoge#pattern}\--hogeの最初の部分と、patternが一致する場合、最も短
    い一致部分を削除し、残りの部分を返す。
-   \${hoge##pattern}\--hogeの最初の部分と、patternが一致する場合、最も
    長い一致部分を削除し、残りの部分を返す。
-   \${hoge%pattern}\--hogeの最後の部分と、patternが一致する場合、最も短
    い一致部分を削除し、残りの部分を返す。\
    <font color='red'>newname=\${hoge%.tex}.txtとすると拡張子の変換が一括でできる。</font>便利\
    ただし、マッチしない場合は、単純に後ろに付け加わるので、注意 !
-   \${hoge%%pattern}\--hogeの最後の部分と、patternが一致する場合、最も長
    い一致部分を削除し、残りの部分を返す。

## gnome メニューから電源offが消えた!

- gnome-shell-extensionsは入っているが、どのようにしたらいいかわからん?!
- システムメニューの高度な設定\
GNOME Shell extension 拡張機能の中のAlternative Status Menu
拡張機能　をON

なおった!!!\
http://maguro.2ch.sc/test/read.cgi/linux/1402722086/

## findの使い方

###   基本

        -atime n: access
        -ctime n: changestatus
        -mtime n: modify

    -nでn日より後、 +nでn日より前\
    time=\>minで分指定 -type {b,c,d,f,l}:block file ,caracter file, dir,
    file, symlink

        find ./docs -mtime -1
        find ./docs -mmin -600
        find ./docs -mmin -600 | xargs ls -al

###   ある日時指定

        find ./docs/ -newerct '2015/2/5 0:0:0' -and ! -newerct '2015/2/6 0:0:0'

すごい!

###   文字列のあるファイル

        find ./ -type f -print | xargs grep 'hoge'

 すごい!!!!



## プロセスhogeをまとめてkill

    pgrep hoge | xargs kill -9
    または
    pkill hoge

とってもらくーーー


## unzipで文字化け

windowsのアーカイブをもらってunzipすると、
cp932のままutf8にならないので、ファイル名が化けてます。\
unar を使います。(要 apt install)

    unar ファル名

無事に文字化けしない日本語が読めます。

unzip -Ocp932

もあるそうですが、私の環境では-Oは使えませんでした。

unarでもファイル名が化けた場合は、encodingを直接指定します。

    unar -e cp932 ファル名



## Windowsの日本語ファイル名かつパスワード付きzipの解凍


上記unarでできました!Happy!(unzipの -Pではcheckdir errorと怒られました)\
unar -p password filename\
password中に&が入って怒られたときは、\\&で切り抜けました。
