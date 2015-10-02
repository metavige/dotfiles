function FindProxyForURL(url, host) {

	if (isPlainHostName(host)) return "DIRECT";
	if (host == 'localhost') {
		return "DIRECT";
	}
	
  // var quantaProxy = "PROXY http://99122010%40quanta:%212015_July%40@proxy";
	var bypassProxy = "PROXY 192.168.0.107:6588";
  var quantaProxy = "PROXY proxy:80";

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

  // for camp-test
  if (url.indexOf("camp-test.quanta-camp.com") > 0) {
    return quantaProxy;
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
      // return "DIRECT";
      return quantaProxy;
		}
	}

  if (url.substring(0, 6) == 'https:') {
    // return "DIRECT";
    // return bypassProxy;
      return quantaProxy;
  }
    
	// bypass to 107
	var byPassDomains = [
		".facebook.com",
		".fbcdn.net",
		".akamaihd.net",
		".twitter.com",
		".twimg.com",
		".plurk.com",
		".flipboard.com",
		".github.com",
		".mobile01.com",
		".xuite.net"
	];

	for (var i in byPassDomains) {
		if (dnsDomainIs(host, byPassDomains[i])) {
      return bypassProxy;
		}
	}

  // 除了以上的連線之外, 走公司的 Proxy
  // return bypassProxy;
  return quantaProxy;

}
