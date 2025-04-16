#!/bin/bash

echo "🔐 Welcome to the Password Generator 🔐"

read -p "What's your first name? " first_name
read -p "What is your birth month? (e.g., 04) " birth_month
read -p "What's your favorite team? " fav_team
read -p "What's your favorite color? " fav_color
read -p "What's your favorite animal? " fav_animal
read -p "Your secret word? " secret_word

# Combine all inputs into a single string
input_string="${first_name}_${birth_month}_${fav_team}_${fav_color}_${fav_animal}_${secret_word}"

# Generate a hash from the input string
hash=$(echo -n "$input_string" | sha256sum | awk '{print $1}')

# Generate deterministic passwords using parts of the hash
pw1="${first_name}${birth_month}@${fav_team}"
pw2="${fav_color}#${fav_animal}${birth_month}"
pw3="${fav_team:0:3}${hash:0:4}_${birth_month}"
pw4="$(echo $fav_animal | rev)${birth_month}*${fav_color:0:2}"
pw5="${first_name^}_${fav_team,,}!${hash:10:4}${secret_word:0:2}"
# I Hope You Are Having Fun :)
echo ""
echo "🔑 Here are your 5 password suggestions:"
echo "1. $pw1"
echo "2. $pw2"
echo "3. $pw3"
echo "4. $pw4"
echo "5. $pw5"
