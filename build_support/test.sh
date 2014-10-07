#!/bin/bash

rm -rf ./bin
mkdir bin
mkdir bin/tests
haxe targets/test.hxml
neko bin/tests/tests.n
