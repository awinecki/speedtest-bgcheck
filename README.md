# Speedtest – background check

Checks continuously (every `10 minutes` by default) UP/DOWN speeds using speedtest.net CLI (https://www.speedtest.net/apps/cli), and reports to `results.txt` file.

### Install

```
make install-speedtest
```

### Run

```
make test
```

You can also specify the interval in seconds, like `make test sleep=15` (checks every 15 seconds). I recommend running this in a background process, either by using `&` in bash, or better, `tmux` or `screen`.

Then, after a while come back and check `results.txt`. To filter just Download speeds, run `make print-downloads`.

If it's inconsistent, you know you need to call your ISP ;-).


