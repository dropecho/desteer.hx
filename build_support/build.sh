#!/bin/bash

rm -rf bin
mkdir bin
mkdir bin/js
haxe targets/js.hxml

cp README.md bin/js
cp package.json bin/js
