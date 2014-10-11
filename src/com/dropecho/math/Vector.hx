package com.dropecho.math;

abstract Vector({ x:Float, y:Float, z:Float}) {
	public var x(get,set) : Float;
	public var y(get,set) : Float;
	public var z(get,set) : Float;
	public var length(get,never) : Float;

	public function new(x : Float, y : Float, z: Float = 0){
		this = { x:x, y:y, z:z };
	}

	@:from 
	public static function from3(vec : {x:Float, y:Float, z:Float}){
		return cast vec;
	}

	@:from
	public static function from2(vec : {x:Float, y:Float}){
		var rt : Dynamic = vec;
		rt.z = 0.0;
		return cast rt;
	}

	@:to 
	inline public function to() {
		return cast this;
	}

	@:op(A * B)
	inline public function dot(vec : Vector) : Float { 
		var x = this.x * vec.x;
		var y = this.y * vec.y;
		var z = this.z * vec.z;

		return x + y + z;
	}

	@:op(A % B)
	inline public function cross(vec : Vector) : Vector {
		var x = (this.y * vec.z) - (this.z * vec.y);
		var y = (this.z * vec.x) - (this.x * vec.z);
		var z = (this.x * vec.y) - (this.y * vec.x);

		return new Vector(x, y, z);
	}

	@:op(A == B)
	inline public function equals(vec : Vector) : Bool {
		return this.x == vec.x && this.y == vec.y && this.z == vec.z;
	}

	@:op(A == B)
	inline static public function equals2(vec : Vector, vec2 : Vector) : Bool {
		return vec == vec2;
	}

	@:op(A != B)
	inline public function notEquals(vec : Vector) : Bool {
		return !vec.equals(this);
	}
	
	@:op(A * B)
    inline public function scale(scalar : Float) : Vector {
		this.x *= scalar;
		this.y *= scalar;
		this.z *= scalar;
		return this;
	};
	
	@:op(A * B)
	inline static public function scale2(scalar : Float, vec:Vector) : Vector{
		return vec.scale(scalar);
	}

	@:op(A + B)
	inline public function addVector(vec : Vector) : Vector {
		this.x += vec.x;
		this.y += vec.y;
		this.z += vec.z;

		return this;
	}

	@:op(A + B)
	inline public function addScalar(scalar : Float) : Vector {
		this.x += scalar;
		this.y += scalar;
		this.z += scalar;

		return this;
	}

	@:op(A + B)
	inline static public function addScalar2(scalar : Float, vec : Vector) : Vector {
		return vec.addScalar(scalar);
	}

	@:op(A - B)
	inline public function subVector(vec : Vector) : Vector {
		this.x -= vec.x;
		this.y -= vec.y;
		this.z -= vec.z;

		return this;
	}
	
	@:op(A + B)
	inline public function subScalar(scalar : Float) : Vector {
		this.x -= scalar;
		this.y -= scalar;
		this.z -= scalar;

		return this;
	}

	@:op(A + B)
	inline static public function subScalar2(scalar : Float, vec : Vector) : Vector {
		return vec.subScalar(scalar);
	}

	public function get_length() : Float{
		return 0.0;
	}

	public function get_x() : Float {
		return this.x;
	}

	public function set_x(x : Float) : Float {
		this.x = x;
		return this.x;
	}
	
	public function get_y() : Float {
		return this.y;
	}

	public function set_y(y : Float) : Float {
		this.y = y;
		return this.y;
	}

	public function get_z() : Float {
		return this.z;
	}

	public function set_z(z : Float) : Float {
		this.z = z;
		return this.z;
	}
}
