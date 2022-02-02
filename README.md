![Image1](https://github.com/Jiriteach/FCOVPN/blob/d4f3332bc284a89a4f9d41c86cd1d9559e4324b9/screenshots/Screen%20Shot%202022-02-02%20at%2022.38.42.png?raw=true)

# FCOVPN - Alternative FortiClient VPN Application for MacOS

A faster and easier way of connecting to PPP+SSL VPN!

The offical and freely available client (Forticlient VPN) for MacOS can be found here - https://www.fortinet.com/support/product-downloads#vpn. While it works well - its slow!

## OpenFortiVPN
Is an alternative client for PPP+SSL VPN for Fortinet. It spawns a pppd process and operates the communication between the gateway and this process. Once installed - its simply controlled via shell commands which provides for a fast and easy way of connecting to VPN.
This can be found here - https://github.com/adrienverge/openfortivpn.

## Xbar
Xbar allows you to pipe the output from any script/program in your MacOS menu bar. We can use Xbar as a base to control the GUI for the application in MacOS. This can be found here - https://github.com/matryer/xbar.

![Image2](https://github.com/Jiriteach/FCOVPN/blob/main/screenshots/Screen%20Shot%202022-02-02%20at%2022.39.08.png?raw=true?raw=true)

Xbar makes use of plugins which can be easily configured to control Xbar in MacOS's menu bar. 

An existing plugin is available here - https://github.com/matryer/xbar-plugins/blob/main/Network/openfortivpn.sh. I have customised this plugin further for my own requirements. This can be found here - https://github.com/Jiriteach/FCOVPN/blob/main/releases/plugin/001-openfortivpn.sh.

I have also customised Xbar to rename some of the default options and also ensure that any open VPN connections is disconnected if the Xbar is closed.

## Setup/Installation & Usage 
Install OpenFortiVPN using Homebrew - https://formulae.brew.sh/formula/openfortivpn or as per the instructions here - https://github.com/adrienverge/openfortivpn. 

Confirm that OpenFortiVPN is working via Terminal AND you can use sudo to invoke OpenFortiVPN invoke without permission.

* Download application from here - https://github.com/Jiriteach/FCOVPN/releases and drag and drop into Applications on MacOS.
* Run the application and add in the plugin.
* Update the plugin parameters to suit your connection.

### Reference Notes RE - Compiling Xbar
---------------------------------------
Based on - https://wails.app/

Requires - 
1. Go
2. NPM/NodeJS

Go Version Required - go install github.com/wailsapp/wails/v2/cmd/wails@v2.0.0-alpha.72