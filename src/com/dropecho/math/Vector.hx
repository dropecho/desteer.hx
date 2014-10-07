package com.dropecho.math;

abstract Vector({ x:Float, y:Float, z:Float}) {
	public var length(get,never) : Float;
	public function new(x : Float, y : Float, z: Float){
		this = { x:x, y:y, z:z };
	}

	@:from //This may cause weirdness cause it allows any cast type
	public static function from(vec : Dynamic){
		vec.z = vec.z == null ? 0.0 : vec.z;
		return cast vec;
	}

	@:to 
	inline public function to() {
		return cast this;
	}

	@:op(A * B)
	public function scale(scalar : Float) : Vector {
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

	public function get_length() : Float{
		return 0.0;
	}
}
