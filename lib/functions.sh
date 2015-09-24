#!/bin/sh

make_all(){
	make -j`psrinfo| wc -l`
}
