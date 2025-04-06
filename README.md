# Netgear M1


<a id="netgear-top"></a>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/batann/netgear/docs/logo.png">
    <img src="docs/logo.png" alt="Logo" width="518" height="518">
  </a>

<h3 align="center">LC-Linux</h3>

  <p align="center">
    Work in progress,
    intended was a light-weight linux distribution based on AntiX-base-OS
    but it seems to....
    <br />
    <a href="https://github.com/batann/netgear"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/batann/netgear">View Demo</a>
    ·
    <a href="https://github.com/batann/netgear/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/batann/netgear/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## About The Project

 <img src="docs/netgear.png" width="474" height="158">
###### cloned from https://github.com/mtreinik/data-transfer-monitor.git
   The Project consists of two main scripts:
  1) netgear-m1.sh [[ Script to control router via cli ]]
        `netgear-m1.sh` is a command line utility for querying and controlling a [Netgear M1 router](https://www.netgear.com/home/products/mobile-broadband/mobilerouters/MR1100.aspx).
  2) get-data.sh [[ Data transfer monitor ]]
         This is a simple utility for querying data transfer of a mobile router and plotting the transfer rates in a browser.






<p align="right">(<a href="#netgear-top">back to top</a>)</p>



### Built With

* [![Next][Next.js]][Next-url]
* [![React][React.js]][React-url]
* [![Vue][Vue.js]][Vue-url]
* [![Angular][Angular.io]][Angular-url]
* [![Svelte][Svelte.dev]][Svelte-url]
* [![Laravel][Laravel.com]][Laravel-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]
* [![JQuery][JQuery.com]][JQuery-url]

<p align="right">(<a href="#netgear-top">back to top</a>)</p>


### Prerequisites
The utility only requires very common UNIX tools:

- [bash](https://www.gnu.org/software/bash/)
- [curl](https://curl.haxx.se/)
- [mktemp](https://www.gnu.org/software/autogen/mktemp.html)

 


### Installation
Clone the repository and you are good to go.


<p align="right">(<a href="#netgear-top">back to top</a>)</p>

# I Netgear 

<!-- USAGE EXAMPLES -->
## Usage
```
Usage:
  netgear-m1.sh status [--json]
  netgear-m1.sh reboot
  netgear-m1.sh connect
  netgear-m1.sh disconnect
  netgear-m1.sh reconnect
  netgear-m1.sh -h | --help

Options:
  -h --help  Show usage screen.
  --json     Output full router status in JSON format.

Commands:
  status     Output router status. Default is brief human readable output.
  reboot     Reboot router.
  connect    Turn cellular data connection on.
  disconnect Turn cellular data connection off.
  reconnect  Turn cellular data connection off and on again.

By default the utility connects router at IP address 192.168.1.1.
Another IP address can be provided environment variable NETGEAR_M1_IP.
```

## Commands

The utility has the following commands for controlling the router:

- status
- reboot
- disconnect
- connect
- reconnect

All commands except status require admin password of the router. The utility will ask for the password. The utility does not save the password, but it stores a session cookie received from the router to a temporary file, which is deleted when the utility exists.

If you want to run the utility with no user interaction, you can pipe the password to the utility like this:

```
$ echo $PASSWORD | ./netgear-m1.sh reboot
```

If your router is not at IP address `192.168.1.1`, please provide alternative IP address in environment variable `NETGEAR_M1_IP`. For example, like this:

```
$ NETGEAR_M1_IP=10.0.0.1 ./netgear-m1.sh reboot
```

### status

This command returns basic information about the status of the router. Status information can be queried without the admin password.

```
$ ./netgear-m1.sh status
             Device name: Nighthawk M1
    Battery charge level: 84
              IP address: 192.168.1.99
      Current radio band: LTE B20
        Data transferred: 142027842799
Router connection status: Connected
```

The `--json` flag can be used to store all status information provided by the router.

```
$ ./netgear-m1.sh status --json > model.json
```

### ping

This command sends pings to the network adapter of the router until it responds. After that it waits for the router service API to be available.

```
$ ./netgear-m1.sh ping
Waiting for router startup
Waiting for router services
Router is up
```

### reboot

This command reboots the router

```
$ ./netgear-m1.sh reboot
Password:
Logged in to Nighthawk M1
Rebooting router
Waiting for router shutdown..
Router is down
Waiting for router network adapter..............
Waiting for router services
Router is up
```

### disconnect

This command disconnects the cellular data connection of the router.

```
$ ./netgear-m1.sh disconnect
Password:
Logged in to Nighthawk M1
Disconnected cellular data
```

![mobile data connection disconnected](https://raw.githubusercontent.com/mtreinik/netgear-m1/main/docs/disconnected.png)

### connect

This command connects the cellular data connection of the router.

```
$ ./netgear-m1.sh connect
Password:
Logged in to Nighthawk M1
Connected cellular data
```

![mobile data connection connected](https://raw.githubusercontent.com/mtreinik/netgear-m1/main/docs/connected.png)

### reconnect

This command disconnects and connects the cellular data connection of the router.

```
$ ./netgear-m1.sh reconnect
Password:
Logged in to Nighthawk M1
Disconnected cellular data
Connected cellular data
```


# II Data Transfer Monitor

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











<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#netgear-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@email_client.com

Project Link: [https://github.com/batann/netgear](https://github.com/batann/netgear)

<p align="right">(<a href="#netgear-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#netgear-top">back to top</a>)</p>

