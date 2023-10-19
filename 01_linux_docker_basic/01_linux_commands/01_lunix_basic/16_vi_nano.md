`vi` and `nano` are mostly used text editors.
Although vi is more advanced it is a little bit tricky to use.

1. vi opens file in comment mode. To modify it press i to enter insert mode
Once editing finishes press Esc button to enter ex mode.  
- If you save and quit type `:wq`
- If you quit withoutsaving type `:q!`
- Open particular n'th line `vi +n file_name`

## > If you see E37: No write since last change (add ! to override)  

## press i button switch insert mode and cary on.

Vi stands for Visual. It is a text editor that is an early attempt to a visual text editor.

Vim stands for Vi IMproved. It is an implementation of the Vi standard with many additions. 
It is the most commonly used implementation of the standard. 
Most Linux distributions come with Vim already installed.

More detail: https://www.shell-tips.com/linux/vi-vs-vim/  

2. nano  
`[train@localhost play]$ nano ~/datasets/simple_text.txt`  
modify your document 
 For save and exit 
 ```
 Ctrl+O 
 Enter
 Ctrl+X
 ```
 For exit without saving 
 ```
 Ctrl+X
 n
 ```
 We can use `vi` and `nano` like touch to create and insert something a file
 
 