<h1 align="center">roFetch</h2>

<p align="center">
  <img border="0" src="./image/rofetch-example.png" alt="roFetch example" title="Isn't it simply awesome?!">
</p>

**roFetch (Rodric Fetch), is my home-made GNU/Linux system fetching program. With an addition of random motivational texts for you!**

<hr>

## Instalation & Execution <br>

> Required: <br>

> net-tools (sudo apt-get install net-tools) <br>
> [curl](https://curl.se/docs/install.html) <br>
> [jq](https://stedolan.github.io/jq/download/) <br>

```bash
git clone https://github.com/RodricBr/rofetch
cd rofetch/;chmod +x rofetch
sudo mv rofetch /usr/local/bin/
rofetch
```

## Set custom ascii banner: <br>

```console
$ rofetch -b banner.txt
```

<p align="center">
  <img border="0" src="./image/banner.png" alt="roFetch banner" title="Banner!">
</p>

> If banner not specified, "**r.txt**", which is the default banner, will be set as default. And if no banned is specified then no banner will be applied. <br>
> It is also recommended for the ASCII banner to have about 13 (the rest will be cut off), and to add some <br>
> additional spaces/tabs to correctly align the informations given by the program (inside vim, for example, use **:set list** to view invisible characters).
