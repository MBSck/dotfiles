nhpy ()
{
    nohup python3 $1 > $2&
}

astro ()
{
    ssh -X scheuck@astro-node$1.mpia.de
}
