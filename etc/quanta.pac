function FindProxyForURL(url, host) {

	if (isPlainHostName(host)) return "DIRECT";
	if (host == 'localhost') {
		return "DIRECT";
	}
	
	//var quantaProxy = "PROXY http://99122010%40quanta:%212015_May%40@proxy";
	var quantaProxy = "PROXY proxy:80; 192.168.0.107:6588";
	var bypassProxy = "PROXY 192.168.0.107:6588";

	var netMasks = [{
		p: "192.168.0.0",
		m: "255.255.0.0"
	}, {
		p: "10.0.0.0",
		m: "255.0.0.0"
	}, {
		p: "172.20.0.0",
		m: "255.255.0.0"
	}, {
		p: "172.16.0.0",
		m: "255.255.0.0"
	}];
	
	var resolved_ip = dnsResolve(host);
	for (var i in netMasks) {
		if (isInNet(resolved_ip, netMasks[i].p, netMasks[i].m)) {
			//若在private網路下不經由proxy直接連線
			return "DIRECT";
		}
	}

	// direct domains
	var directDomains = [
		".quanta.corp",
		".quantacn.com",
		".rsquanta.com",
		".quantatw.com",
		".qcisap.corp",
		".quanta-camp.com",
		".nimbus.com",
		".ccasd.com"
	];

	for (var i in directDomains) {
		if (dnsDomainIs(host, directDomains[i])) {
			return "DIRECT";
		}
	}

	// bypass to 107
	var byPassDomains = [
		".facebook.com",
		".fbcdn.net",
		".akamaihd.net",
		"twitter.com",
		".twimg.com",
		".plurk.com",
		"flipboard.com",
		"github.com"
	];

	for (var i in byPassDomains) {
		if (dnsDomainIs(host, byPassDomains[i])) {
			return bypassProxy;
		}
	}

	// 除了以上的連線之外, 走公司的 Proxy 
	return quantaProxy;

}
