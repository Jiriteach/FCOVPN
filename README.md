<img src="https://firewall.news/wp-content/uploads/2017/08/Fortinet-logo.png" width="150" />

# FCOVPN

An alternative to using the FortiClient client on MacOS when connecting to VPN. 
This uses xbar - https://xbarapp.com/ with openfortivpn - https://github.com/adrienverge/openfortivpn to provide an alternative, faster and easier way of connecting to VPN.

Requires openfortivpn to be installed. Easily installed using `Homebrew`

```
# Install 'Homebrew'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install 'openfortivpn'
brew install openfortivpn
```
Once installed - follow the instructions from here to setup openfortivpn and make sure VPN is able to connect using the client via terminal - https://github.com/adrienverge/openfortivpn.

The FCOVPN client provides a MacOS menu bar which can easily be configured to call scripts. While xbar can be used to call many scripts - this has been specifically configured just for FortiClient VPN. 

The package is a complied vesion of the FCOVPN client. This can be extracted to `/applications` and run. Included is the `openfortivpn` plugin. Configuration can be found here - `https://github.com/jiriteach/fcovpn/blob/main/releases/plugin/001-openfortivpn.sh`. Check the parameters and connect. 
