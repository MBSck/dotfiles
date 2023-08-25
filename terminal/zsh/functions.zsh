# FUNCTIONS
# Makes a nohup-python3 with two arguments and if the second one is not specified then the
# name is chosen by default
function nhpy ()
{
    if [[ $# -eq 1 ]]; then
        nohup python3 $1 > ${1%.*}.txt
    else
        nohup python3 $1 > $2&
    fi
}

# Makes a nohup-python3 with two arguments and if the second one is not specified then the
# name is chosen by default. In this case executes a package
function nhppy ()
{
    if [[ $# -eq 1 ]]; then
        nohup python3 -m $1 > ${1%.*}.txt
    else
        nohup python3 -m $1 > $2&
    fi
}

# Connects to an astro-node if none specified connects to a default one
function castro ()
{
    if [[ $# -eq 0 ]]; then
        ssh -X -t "scheuck@astro-node1.mpia.de"
    else
        ssh -X -t "scheuck@astro-node${1}.mpia.de"
    fi
}

function comp ()
{
    if [[ $# -eq 0 ]]; then
        g++ main.cpp -o main.exe 
    else
        g++ $1.cpp -o $1.exe
    fi
}

function compe ()
{
    if [[ $# -eq 0 ]]; then
        g++ main.cpp -o main.exe && ./main.exe
    else
        g++ $1.cpp -o $1.exe && ./$1.exe
    fi
}
