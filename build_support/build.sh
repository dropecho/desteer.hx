#!/bin/bash

rm -rf bin
mkdir bin
mkdir bin/js
haxe targets/js.hxml
