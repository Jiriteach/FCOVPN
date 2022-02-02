![alt text](https://github.com/Jiriteach/FCOVPN/blob/d4f3332bc284a89a4f9d41c86cd1d9559e4324b9/screenshots/Screen%20Shot%202022-02-02%20at%2022.38.42.png?raw=true)

# FortiClient VPN Application for MacOS

![alt text](https://github.com/Jiriteach/FCOVPN/blob/main/screenshots/Screen%20Shot%202022-02-02%20at%2022.39.08.png?raw=true?raw=true)

* Based on Xbar - https://github.com/matryer/xbar
* Based on OpenFortiVPN - https://github.com/adrienverge/openfortivpn

## Xbar
Xbar allows you to pipe the output from any script/program in your MacOS menu bar. This is being used as a base to control the GUI for the application.

## OpenFortiVPN
OpenFortiVPN is a client for PPP+SSL VPN  services. It spawns a pppd process and operates the communication between the gateway and this process.

## Setup/Installation & Usage 
Install OpenFortiVPN using Homebrew - https://formulae.brew.sh/formula/openfortivpn or as per the instructions here - https://github.com/adrienverge/openfortivpn. Confirm that OpenFortiVPN is working via TerminalA AND sudo commands to invoke OpenFortiVPN can be invoked without permission.

Install Xbar and add-in the plugin.
-- Download application from here and drag and drop into Applications on MacOS.
-- Run the application and add in the plugin.
-- Update the plugin parameters to suit your connection.

### Reference Notes RE - compiling Xbar
---------------------------------------
Based on - https://wails.app/

Requires - 
1. Go
2. NPM/NodeJS

Go Version Required - go install github.com/wailsapp/wails/v2/cmd/wails@v2.0.0-alpha.72
