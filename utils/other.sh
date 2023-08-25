alias yt="youtube-dl"

# list video formats
function ytf() {
    youtube-dl -F "$1"
}
# from that list of formats, download the one with the highest resolution
function ytd() {
    youtube-dl -f "$1" "$2"
}
# download audio in mp3 format
function yta() {
    youtube-dl -x --audio-format mp3 "$1"
}

alias s="scala"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
