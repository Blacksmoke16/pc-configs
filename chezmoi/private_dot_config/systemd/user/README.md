# GPG

As pointed out in the [Arch Wiki](https://wiki.archlinux.org/title/GnuPG#gpg-agent), since I'm using a non-default `GNUPGHOME` directory I had to copy the socket unit files into my home directory to change the `ListenStream` to the new custom path. I also had to copy in the agent service itself to give the custom path via `--homedir`.
