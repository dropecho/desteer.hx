package com.dropecho.ai.tests;

class TestRunner {
    
    static function main(){
        var r = new haxe.unit.TestRunner();

        if(!r.run()){
        	throw "Failed Tests.";
        }
    }
}
