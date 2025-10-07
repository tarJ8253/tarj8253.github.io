clear all
close all
clc
pkg load control
G=tf(1,[1 1 1]);
step(G)
print(1,"s1.svg","-dsvg");
