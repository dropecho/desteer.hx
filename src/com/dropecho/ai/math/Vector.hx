abstract Vector({ x:Float, y:Float, z:Float}) {
	public function new(x : Float, y : Float, z: Float){
		this = { x:x, y:y, z:z };
	}

	@:from
	public static function from(vec : Dynamic){
		vec.z = vec.z == null ? 0.0 : vec.z;
		return cast vec;
	}

	@:to 
	inline public function to() {
		return cast this;
	}

	@:op(A * B)
	inline public static function scale2(scalar : Float, vec:Vector) : Vector{
		return vec.scale(scalar);
	}

	@:op(A * B)
	public function scale(scalar : Float) : Vector {
		this.x *= scalar;
		this.y *= scalar;
		this.z *= scalar;
		return this;
	};
}
