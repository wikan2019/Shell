#!/bash/bin
start_vpn(){
	 openvpn3 session-start --config ~/.config/vpn/huikang.conf
}

stop_vpn(){
	openvpn3 session-manage -D --config ~/.config/vpn/huikang.conf
}

start_ss(){
	cd ~/ThirdSoftware && ./Shadowsocks-Qt5-3.0.1-x86_64.AppImage
}
