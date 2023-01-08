$CONFIG="$HOME/.config/nvim"

$UNDO_DIR="$CONFIG/undo"
$SPELL_DIR="$CONFIG/spell"
$AUTOLOAD_DIR="$CONFIG/autoload"

$undo_exists = Test-Path $UNDO_DIR
if ($undo_exists -eq $false) {
	mkdir $UNDO_DIR
}

$spell_exists = Test-Path $SPELL_DIR
if ($spell_exists -eq $false) {
	mkdir $SPELL_DIR
}
$autoload_exists = Test-Path $AUTOLOAD_DIR
if ($autoload_exists -eq $false) {
	mkdir $AUTOLOAD_DIR
}

$path_exists = Test-Path -Path $CONFIG/autoload/plug.vim -PathType Leaf
if ($path_exists -eq $false) {
    curl -fLo $CONFIG/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

nvim +"PlugSnapshot! $CONFIG/snapshot.vim" +PlugUpgrade +PlugClean! +PlugUpdate +qa
nvim +UpdateRemotePlugins +qa
