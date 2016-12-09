package com.dropecho.math;

@:expose('de.math.Vector')
class Vector {
	public var x: Float;
	public var y: Float;
	public var z: Float;
	public var length(get, never): Float;

	public function new(x : Float = 0, y : Float = 0, z: Float = 0){
    this.x = x;
    this.y = y;
    this.z = z;
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

  inline public function normalize(scalar : Float) : Vector {
    var length = this.length;
    var normalLength = length != 0 ? (1.0 / length) : 1;
    this.x = this.x * normalLength;
    this.y = this.y * normalLength;	

    if(scalar > 0){
      this.scale(scalar);
    }

    return this;
  }

	// @:op(A == B)
	// inline public function equals(vec : Vector) : Bool {
	//   return this.x == vec.x && this.y == vec.y && this.z == vec.z;
	// }

	// @:op(A == B)
	// inline static public function equals2(vec : Vector, vec2 : Vector) : Bool {
	//   return vec == vec2;
	// }

	// @:op(A != B)
	// inline public function notEquals(vec : Vector) : Bool {
	//   return !vec.equals(this);
	// }
	@:op(A * B)
  inline public function scale(scalar : Float) : Vector {
		this.x *= scalar;
		this.y *= scalar;
		this.z *= scalar;
		return this;
	};

	@:op(A + B)
	inline public function add(vec : Vector) : Vector {
		this.x += vec.x;
		this.y += vec.y;
		this.z += vec.z;

		return this;
	}

	@:op(A - B)
	inline public function sub(vec : Vector) : Vector {
		this.x -= vec.x;
		this.y -= vec.y;
		this.z -= vec.z;

		return this;
	}

	inline static public function midpoint(vec : Vector, vec2 : Vector) : Vector {
		var x = (vec.x + vec2.x) / 2;
		var y = (vec.y + vec2.y) / 2;
		var z = (vec.z + vec2.z) / 2;

		return new Vector(x,y,z);
	}

  inline public function get_length() : Float {
    return Math.sqrt((this.x * this.x) + (this.y * this.y));
  }

  inline public function distanceFrom(vec : Vector) : Float {
    return new Vector(this.x - vec.x,this.y - vec.y, this.z - vec.z).length;
  }

  inline static public function add2(vec1:Vector, vec2:Vector):Vector {
    return new Vector(vec1.x + vec2.x, vec1.y + vec2.y, vec1.z + vec2.z);
  }

  inline static public function sub2(vec1:Vector, vec2:Vector):Vector {
    return new Vector(vec1.x - vec2.x, vec1.y - vec2.y, vec1.z - vec2.z);
  }

  inline static public function fromDeg(deg : Float) : Vector {
    return Vector.fromRad(MathUtils.degToRad(deg));
  }

  inline static public function fromRad(rad : Float) : Vector {
    var x = MathUtils.round(Math.cos(rad), 7);
    var y = MathUtils.round(Math.sin(rad), 7);

    return new Vector(x,y);
  }
}
