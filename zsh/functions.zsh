# FUNCTIONS
# Makes a nohup-python3 with two arguments and if the second one is not specified then the
# name is chosen by default.
function nhpy ()
{
    if [[ $# -eq 1 ]]; then
        nohup python3 $1 > ${1%.*}.txt
    else
        nohup python3 $1 > $2&
    fi
}

# Makes a nohup-python3 with two arguments and if the second one is not specified then the
# name is chosen by default. In this case executes a package.
function nhppy ()
{
    if [[ $# -eq 1 ]]; then
        nohup python3 -m $1 > ${1%.*}.txt
    else
        nohup python3 -m $1 > $2&
    fi
}

# Connects to an astro-node if none specified connects to a default one.
function castro ()
{
    kitty @ set-tab-title castro
    if [[ $# -eq 0 ]]; then
        ssh -X -t "scheuck@astro-node1.mpia.de"
    else
        ssh -X -t "scheuck@astro-node${1}.mpia.de"
    fi
}

# Compiles a program with additional flags.
function comp ()
{
    default_file="main"
    source_file=""
    include_path=""
    run=false

    # Parse command line arguments
    while [ $# -gt 0 ]; do
      case "$1" in
        -e)
          run=true
          ;;
        -I)
          shift
          include_path="-I $1 "
          ;;
        *)
          source_file="$1"
          ;;
      esac
      shift
    done

    rm -f $default_file
    if [ -z "$source_file" ]; then
      source_file=$(find . -type f -name "$default_file*")
    fi

    g++ -std=c++11 $include_path $source_file -o $default_file

    if [ "$run" = true ]; then
      "./$default_name"
    fi
}


# Compiles a program with additional flags.
function ccomp ()
{
    run=false

    if ! [[ -d build ]]; then
        mkdir -p build/
    fi

    # Parse command line arguments
    while [ $# -gt 0 ]; do
      case "$1" in
        -e)
          run=true
          ;;
        *)
          source_file="$1"
          ;;
      esac
      shift
    done

    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B build/ && cmake --build build/

    if [ "$run" = true ]; then
        source_file=$(grep -w project CMakeLists.txt | awk -F'[()]' '{print $2}' | awk '{print $1}')
      "./build/$source_file"
    fi
}

function rmd ()
{
  DIRECTORY="."
  find $DIRECTORY -type d -empty -exec rmdir {} \;
}

function _fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

function _fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
}

# TODO: Finish this function to automatically execute packages from within
function find_last_pyproject_dir() {
    local dir="$PWD"

    while [[ "$dir" != "/" ]]; do
        if [[ -f "$dir/pyproject.toml" ]]; then
            echo "$(basename "$dir")"
            return
        fi
        dir=$(dirname "$dir")
    done
}

