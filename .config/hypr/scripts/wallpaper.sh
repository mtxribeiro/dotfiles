#!/usr/bin/env fish

set WALLDIR "$HOME/Imagens/Wallpapers"
set TARGET "$WALLDIR/001.jpg"
set INDEXFILE "$WALLDIR/.wall_index"

# lista de arquivos ignorando 001.jpg e também o último da pasta
set ALLFILES (find $WALLDIR -maxdepth 1 -type f ! -name '001.jpg' | sort)
set FILES $ALLFILES[1..(math (count $ALLFILES) - 1)]

test (count $FILES) -eq 0; and echo "Nenhum wallpaper disponível."; and exit 0

# índice atual (default 1)
set INDEX (test -f $INDEXFILE; and cat $INDEXFILE; or echo 1)

# garante ciclo
set COUNT (count $FILES)
set INDEX (math "($INDEX-1)%$COUNT+1")

# converte para 001.jpg
magick convert $FILES[$INDEX] $TARGET

# salva próximo índice
echo (math "$INDEX%$COUNT+1") > $INDEXFILE

# reinicia hyprpaper
pkill hyprpaper; hyprpaper &
