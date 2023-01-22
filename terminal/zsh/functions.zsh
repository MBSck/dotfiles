# Makes a nohup-python3 with two arguments and if the second one is not specified then the
# name is chosen by default
function nhpy ()
{
    if [[ $# -eq 1 ]]; then
        nohup python3 $1 > "${${1}%.*}.txt"
    else
        nohup python3 $1 > $2&
    fi
}

# Connects to an astro-node if none specified connects to a default one
function castro ()
{
    if [[ $# -eq 0 ]]; then
        ssh -X "scheuck@astro-node1.mpia.de"
    else
        ssh -X "scheuck@astro-node${1}.mpia.de"
    fi
}
