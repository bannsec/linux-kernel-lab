
if [[ "$#" != "1" ]]; then
    echo "Usage: $0 <vmlinux_file>"
    echo "Example: $0 linux-4.20.6/vmlinux"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "$1 doesn't appear to be a file."
    exit 2
fi

pushd . >/dev/null

cd `dirname $1`
gdb -ex 'set print pretty on' -ex 'set disassembly-flavor intel' -ex 'target remote :1234' -iex "add-auto-load-safe-path $PWD" -tui `basename $1`

popd >/dev/null
