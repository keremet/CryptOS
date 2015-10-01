#!/bin/sh

make_all(){
	make -j`psrinfo| wc -l`
}

publish_pkg(){
	pkgsend publish -s /export/repo_cryptos manifest
}
