# !/bin/bash
awk 'NR==9 {sub(/sbin/, "bin") sub(/nologin/,"bash") }1' passwd_new >passwd_tmp && mv passwd_tmp passwd_new
sed -i -e '7s/sbin/bin/g' -e '7s/nologin/bash/g' passwd_new
awk -F [:] 'NR % 2 == 1' passwd_new > passwd_tmp && mv passwd_tmp passwd_new
sed -i '/daemon/d' passwd_new
awk -F [:] 'NR % 2 == 0  { gsub(/sbin/, "bin" ) gsub(/false/, "zsh") gsub(/nologin/, "zsh")   }1' passwd_new > passwd_tmp && mv passwd_tmp passwd_new
awk '{gsub(/ee/,"alala" ) }1' poem_new.txt > poem_tmp.txt && mv poem_tmp.txt poem_new.txt
awk '{gsub(/[/./]+/, "!") }1' poem_new.txt > poem_tmp.txt && mv poem_tmp.txt poem_new.txt
sed -i '/./!d' poem_new.txt
