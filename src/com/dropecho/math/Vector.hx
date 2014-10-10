package com.dropecho.math;

abstract Vector({ x:Float, y:Float, z:Float}) {
	public var x(get,set) : Float;
	public var y(get,set) : Float;
	public var z(get,set) : Float;
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

	@:op(A + B)
	inline public function addVector(vec : Vector) : Vector {
		this.x += vec.x;
		this.y += vec.y;
		this.z += vec.z;

		return this;
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
