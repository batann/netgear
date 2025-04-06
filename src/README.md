# Data transfer monitor

This is a simple utility for querying data transfer of a mobile router and plotting the transfer rates in a browser.

## Usage

1. Change to directory `src`
1. Start script `./get-data.sh`
1. Open `src/index.html` in browser

## Getting the data

The script `get-data.sh` uses the [netgear-m1.sh](https://github.com/mtreinik/netgear-m1) utility to query the amount of data transferred by the mobile router every ten seconds.

The script appends the data with timestamps to a file in a format that is executable JavaScript code:

```
const d = []
d.push([new Date('2020-11-07T21:10:40'), 149306227908])
d.push([new Date('2020-11-07T21:10:50'), 149314387262])
d.push([new Date('2020-11-07T21:11:09'), 149326465165])
```

## Visualizing the data

The data is visualized on a HTML page by using [Google Charts](https://developers.google.com/chart)

![example chart](https://raw.githubusercontent.com/mtreinik/data-transfer-monitor/main/docs/data_transferred.png)
