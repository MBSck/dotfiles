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
    if [[ $# -eq 0 ]]; then
        ssh -X -t "scheuck@astro-node1.mpia.de"
    else
        ssh -X -t "scheuck@astro-node${1}.mpia.de"
    fi
}

# Compiles a program with additional flags.
function comp ()
{
    source_file="main"
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

    g++ -std=c++11 $include_path "$source_file.cpp" -o "$source_file"

    if [ "$run" = true ]; then
      "./$source_file"
    fi
}
