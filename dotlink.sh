# dotlink.sh
# 一括でdotfilesのdotファイルをリンクする

for file in .*
do
  if [ $file = ".." -o $file = "." ]; then
    continue
  fi

  ln -sf $file ~/$file
done
