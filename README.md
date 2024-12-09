# randomvpnconn

is a command-line tool designed for Linux users who utilize NordVPN as their VPN provider. This tool enhances the NordVPN experience by adding a convenient functionality to randomly connect to one of the countries available in NordVPN's server list. It offers an easy way to establish a VPN connection without manually selecting a country, ensuring a seamless and secure browsing experience.

# Dependencies

### NordVPN CLI:

The tool relies on the NordVPN CLI being installed and properly configured on your system. You must log in and set up NordVPN beforehand.

# Use Case

You can place randomvpnconn in your `/usr/bin` directory and configure it to run automatically during system boot. This setup allows your computer to connect to a random country in the NordVPN network every time it starts, providing instant security and convenience without user intervention.

For example, you can add a line in your crontab or systemd service to run randomvpnconn at startup:
`@reboot /usr/bin/randomvpnconn`

# \*Important Note

While randomvpnconn helps secure your connection by using NordVPN's network, simply using a VPN does not guarantee full anonymity. Other factors such as browser cookies, device fingerprinting, and data from apps may still expose your identity. For enhanced privacy, use additional tools like secure browsers, disable tracking, and regularly clear your browsing data.
