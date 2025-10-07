clear all
close all
clc

% octave,dialog boxでgoogle
%msgbox(msg,title)
%errordlg(msg)
%helpdlg(msg)
%inputdlg(prompt)
%listdlg(key,value)
%questdlg(msg)--yes/no
%warndlg(msg)

%OKボタン押す前に終了してしまう。!!
%%{
H=msgbox("OK!?");
uiwait(H)%これで入力待ちできる
H=errordlg("ERROR!");
uiwait(H)%これで入力待ちできる
H=helpdlg("HELP YOU");
uiwait(H)%これで入力待ちできる
H=warndlg("WARNING!!!");
uiwait(H)%これで入力待ちできる
%%}


%{
%無限ループに入ってしまう
btn="No";
do
btn=msgbox("Understand?")
until (strcmp(btn,"OK")==true)
%}
%btn=msgbox("日本語?")%不可
%{
これでも無限ループ
btn=msgbox("Understand?");
while (strcmp(btn,"Yes")==false)
btn=msgbox("Understand?");
end
%}

%disp("EndMSG")

%btn=errordlg("ERRO");

%d=inputdlg("Input data name");%入力可能
%doc listdlg( 35.1 I/O Dialogs )記載のsample

%sample 1
%%{

prompt = {"Width", "Height", "Depth"};
defaults = {"1.10", "2.20", "3.30"};
rowscols = [1,10; 2,20; 3,30];
dims = inputdlg (prompt, "Enter Box Dimensions", ...
                 rowscols, defaults);
%%}

%sample 2
%{
my_options = {"An item", "another", "yet another"};
[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple");
if (ok == 1)
  disp ("You selected:");
  for i = 1:numel (sel)
    disp (sprintf ("\t%s", my_options{sel(i)}));
  endfor
else
  disp ("You cancelled.");
endif
%}



%{
btn=questdlg("svg output?","DialgBoxTitle");
%btn=questdlg("svg output?","DialgBoxTitle","Yes","No","Halt","Cancel","STOP")%BTN3つまで???
%}

%btn=questdlg("svg output?","DialgBoxTitle");%Yes,No,Cancelが現れる

%btn=questdlg("svg output?","DialgBoxTitle","No","Yes")%Yes,No,Cancelが現れる

%btn=questdlg("svg output?","DialgBoxTitle","No")%Yes,No,Cancelが現れ,default NO

%btn=questdlg("svg output?","DialgBoxTitle","No","Yes","No")%BTN2つまで！3番目はdefault
%btn=questdlg("svg output?","DialgBoxTitle","No","Hoge","Yes","Stop","No")%BTN3つまで！3番目はdefault
                                                                         %最後はどれかと一致すること
                                                                         %questdlg(MSG,TITLE,BTN1,BTN2,BTN3,DEFAULT)!


%{
select={"Yes","No","Halt","Cancel"};
btn=questdlg("svg output?","DialgBoxTitle",select)%BTN拡張できない???
%}

%%{
btn = questdlg ("Close Octave?", "Some fancy title", ...
                "Yes", "No", "No");
%uiwait(btn)%これで入力待ちできる

if (strcmp (btn, "Yes"))
  exit ();
else
  H=msgbox("Octave continue");
  uiwait(H)
endif
%%}

%{
%## create an empty dialog window titled "Dialog Example"
h = dialog ("name", "Dialog Example");

%## create a button (default style)
b = uicontrol (h, "string", "OK",
                  "position", [10 10 150 40],
                  "callback", "delete (gcf)");

%## wait for dialog to resume or close
uiwait (h);
%}

%;を末尾につけない??--つけてもok

%{
if(btn == 'Yes')
    disp('svg out')
elseif(btn == 'No')
    disp('exit')
else
    disp('cancel')
end
%}
%{
if (strcmp(btn,'Yes')==1)
    disp('svg out')
elseif(strcmp(btn,'No')==1)
    disp('exit')
else
    disp('cancel')
end
%}
