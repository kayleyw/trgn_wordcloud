#!/usr/bin/bash
cd ~/assignments/trgn_wordcloud/

counter=1

while read url

    do

        wget -O ~/assignments/trgn_wordcloud/current_pages/file${counter}.html $url

        ((counter++)) 

    done<my_webpages.txt

PATH_html2text=$(which html2text.py)

${PATH_html2text} current_pages/file1.html > my_current.txt

${PATH_html2text} current_pages/file2.html >> my_current.txt

PATH_wordcloud=$(which wordcloud_cli)

${PATH_wordcloud} --text my_current.txt --imagefile wordcloud.png --mask mask_wordcloud-removebg-preview.jpg --background "white" --min_font_size 1 --min_word_length 6 --width 800 --height 400 --margin 1  

cp wordcloud.png ~/public_html

echo "Successfully run for $USER"
