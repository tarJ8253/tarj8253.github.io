---
title: "Octaveを用いたデータの読み込みと書き込み"
date: 2025-03-04T15:35:17+09:00
draft: false #true
lang: ja
categories:
  - control
tags: 
  - octave
  - dlmread
series:
  - octave
#2021.4.9:初版
---

octaveは、csvファイルを読み込みがとても簡単にできます。

<!--# Octaveを用いたデータの読み込みと書き込み-->

<!--more-->


## ファイルを選ぶ

ファイル名が決まっていない場合や任意のファイルを選びたい場合などでは、
OctaveではGUIを用いて選んだファイルのファイル名を取得できます。

``` octave
     [fname fpath fltindex]=uigetfile();
     [fname fpath fltindex]=uiputfile();
```

-   uigetfile()はファイル読み込みのダイアログが開きます。

``` octave
	[fname fpath fltindex]=uigetfile("*.ext")
```
    とすれば、表示するファイルの拡張子extを指定できるようです。

-   uiputfile()はファイル保存のダイアログが開きます。

読み書きするためのパスまで含んだ全ファイル名は次のようにすれば設定できます。

``` octave
     FILENAME=[fpath fname]
```

これを以下の関数に用いるFILENAMEとすれば、扱うファイルをGUIで取捨選択できます。

## 読み込み関数と書き込み関数

代表的なファイルフォーマットに対応する読み込み/書き込み関数

<table><tr><td></td><td></td><td></td></tr>
<tr><td>  ファイルタイプ   </td><td>  代表的な拡張子   </td><td> 対応する読み込み関数  </td><td> 書き込み関数 </td></tr>
<tr><td>  テキストファイル </td><td>  .txt .csv .dat </td><td>   csvread,dlmread, load </td><td> csvwrite, save </td></tr>

<tr><td>  スプレッドシート </td><td>  .xls  </td><td>            xlsread </td><td>               xlswrite </td></tr>

<tr><td>  音声ファイル </td><td>      .wav  </td><td>            audioread<br>(wavread:廃止予定) </td><td> audiowrite<br>(wavwrite:廃止予定) </td></tr>
                                            

<tr><td>  動画ファイル<br>(video package必要)    </td><td>  .avu      </td><td>        aviread  </td><td>       aviwrite </td></tr>
                                                      
                                                

<tr><td>  画像ファイル     </td><td>  .bmp .jpg .gif   </td><td> imread      </td><td>           imwrite</td></tr>

<tr><td>  Octave(Matlab)<br>固有ファイル   </td><td> .mat            </td><td>  load  </td><td>             save </td></tr>
<tr><td>         
万能<br>
  ASCII table,<br> Image File,<br>  MATLAB file,<br>
  Spreadsheet files,<br>
  WAV file
</td>
<td></td>
<td> importdata(FNAME)</td>
<td></td>
</tr></table>


-   原始的な読み込み関数として textscan(FID,FORMAT)があります。\
    しかしFORMAT(保存している書式や形式)が不明な場合は、正しく読み込めません。

-   importdata(FILENAME)は、汎用的にデータファイルを読み込めます。\
    文字と数値が混在しているデータファイルも読み込めますが、
    読み込んだデータの型がstructになりその後の処理が大変複雑になるので
    あまり使われていないようです。

-   dlmreadはデータの区切り(デリミタ)を任意の文字に指定でき るものです。
    tabや空白を区切りに用いることが多いです。

``` octave
	dlmread(FILENAME,SEP,R0,C0)
```

SEPはセパレータで、データ区切りを示します。\
R0,C0は行と列の最初の読み飛ばし数を示します。\
たとえば

``` octave
	x=dlmread(FILENAME,',',2,0)
```

とするとデータ区切りは,(コンマ)、最初の2行を読み飛ばして読み込みます。\
データファイルにヘッダがついていてもコメント行扱いできるので、便利です。

-   dlmreadのセパレータをコンマ,(comma)に指定したものがcsvreadです。\
    csvとはcomma-saparated-valueの略で、データの区切りをコンマ(,)としたファイルの通称をcsvファイルといいます。
    -   csvwrite(FILENAME,配列変数名);で、配列変数名の数値を、そののままのサイズで保存します。

	-   読み込みは
``` octave
	t=csvread(FILENAME);
```
FILENAMEの変数値が変数名tに設定されます。
保存時の変数名と一致させる必要はありません。

FILEの内容が既知であることが必要です。

-   saveとload

	+ save FILENAME とすると ワークスペースをそのまま全て保存します。\
   つまり変数名とその値をセットにして保存します。\
	保存したファイルはascii形式ですのでエディタで内容読めます。

``` octave
	save FILENAME a,b,c
```

とすると、 ワークスペース内のa,b,cのみをFILENAMEに保存します。

``` octave
	save options　保存ファイル名　変数名
```

として、さまざまなoption指定を行って保存できます。\
例えば、-binaryとすると、バイナリ形式になります。
help saveして調べてください。 

- load FILENAMEとすると保存した変数と変数値をそのまま読み込めます。

*   ファイル名の拡張子がmatのファイルの読み書き\
    MATLAB固有(互換)形式なので、mat形式と呼ばれています。
	
*   save hage.matでmat形式で保存されます。Octaveではascii形式のようです。
-   matファイルの読み込みはloadで行います。

表計算ソフトでグラフも書けますが、セル内に式を埋め込むと、式の内容が把握しづらくなりメンテナンス性が悪化します。\
	データと処理式を分離することをおすすめします。 そこで、
最低限、基本のcsvファイルを読み書きできるようになりましょう。




<table><tr><td>
<pre>
clear all 
clc
x=0:0.01:10;
y=exp(x);
save 'd1' 
save 'd_y' y
save d2.mat 
</pre>
</td>
<td>
左記のスクリプトを実行し、
保存されたファイルd1,d_y,d2.matを 
適当なテキストエディタ 
(notepad(メモ帳など),
octaveは不可(値として代入される)) 
で開いて見てみよう。<br>
以下のことがわかります。
<ul>
<li>   アスキー形式で読める。
<li>   保存されている変数名と値が示されている。<br>
型と大きさも明示されている。 
<li>   mat形式は効かない?? 
</ul>
</td></tr></table>


<table><tr><td>
<pre>
clear all
clc
x=[1,2,3;4,5,6];
csvwrite('xdata',x);
save 'xd' x 
</pre>
</td>
<td>
<ul>
<li>xdataというファイルに数値のみが保存されている。
<li>xdというファイルには変数名と数値が保存されている。
</ul>
</td></tr>
</table>




<table><tr><td>
<pre>
clear all
clc 
[t]=csvread('xdata');
load 'xd' 
</pre>
</td>
<td>
<ul>
<li>   csvreadは任意の変数名に数値を読み込む。<br>
    保存したときのxdataの変数名は残っていない
<li>   loadは変数名と変数値が組となって読み込む。 
</ul>
</td></tr>
</table>
