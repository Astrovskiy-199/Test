# !/bin/bash
awk 'NR==9 {sub(/sbin/, "bin") sub(/nologin/,"bash") }1' passwd_new >passwd_tmp && mv passwd_tmp passwd_new
sed -i -e '7s/sbin/bin/g' -e '7s/nologin/bash/g' passwd_new
awk -F [:] 'NR % 2 == 1' passwd_new > passwd_tmp && mv passwd_tmp passwd_new
sed -i '/daemon/d' passwd_new
awk -F [:] 'NR % 2 == 0  { gsub(/sbin/, "bin" ) gsub(/false/, "zsh") gsub(/nologin/, "zsh")   }1' passwd_new > passwd_tmp && mv passwd_tmp passwd_new
