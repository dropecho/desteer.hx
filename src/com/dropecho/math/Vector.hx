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
	 public function dot(vec : Vector) : Float {
		var x = this.x * vec.x;
		var y = this.y * vec.y;
		var z = this.z * vec.z;

		return x + y + z;
	}

	@:op(A % B)
	 public function cross(vec : Vector) : Vector {
		var x = (this.y * vec.z) - (this.z * vec.y);
		var y = (this.z * vec.x) - (this.x * vec.z);
		var z = (this.x * vec.y) - (this.y * vec.x);

		return new Vector(x, y, z);
	}

  public function normalize(scale : Float = 0) : Vector {
    var length = this.length;
    var normalLength = length != 0 ? (1.0 / length) : 1;
    this.x = this.x * normalLength;
    this.y = this.y * normalLength;

    return scale == 0 ? this : this.scale(scale);
  }

  @:op(A == B)
   public function equals(vec : Vector) : Bool {
    return this.x == vec.x && this.y == vec.y && this.z == vec.z;
  }

	@:op(A * B)
   public function scale(scalar : Float) : Vector {
		this.x *= scalar;
		this.y *= scalar;
		this.z *= scalar;
		return this;
	};

	@:op(A + B)
	 public function add(vec : Vector) : Vector {
		this.x += vec.x;
		this.y += vec.y;
		this.z += vec.z;

		return this;
	}

	@:op(A - B)
	 public function sub(vec : Vector) : Vector {
		this.x -= vec.x;
		this.y -= vec.y;
		this.z -= vec.z;

		return this;
	}

	 static public function midpoint(vec : Vector, vec2 : Vector) : Vector {
		var x = (vec.x + vec2.x) / 2;
		var y = (vec.y + vec2.y) / 2;
		var z = (vec.z + vec2.z) / 2;

		return new Vector(x,y,z);
	}

   public function get_length() : Float {
    return Math.sqrt((this.x * this.x) + (this.y * this.y));
  }

   public function distanceFrom(vec : Vector) : Float {
    return new Vector(this.x - vec.x,this.y - vec.y, this.z - vec.z).length;
  }

  public function truncate(max:Float) : Vector {
    var scaleFactor = max/this.get_length();
    scaleFactor = scaleFactor < 1.0 ? scaleFactor : 1.0;
    return this.scale(scaleFactor);
  }

  public function toDeg() : Float {
    return MathUtils.radToDeg(Math.atan2(this.y, this.x));
  }

  public function toRad() : Float {
    return Math.atan2(this.y, this.x);
  }

  ///STATIC METHODS

   static public function add2(vec1:Vector, vec2:Vector):Vector {
    return new Vector(vec1.x + vec2.x, vec1.y + vec2.y, vec1.z + vec2.z);
  }

   static public function sub2(vec1:Vector, vec2:Vector):Vector {
    return new Vector(vec1.x - vec2.x, vec1.y - vec2.y, vec1.z - vec2.z);
  }

   static public function scale2(vec:Vector, scale:Float):Vector {
    return new Vector(vec.x, vec.y, vec.z).scale(scale);
  }


   static public function fromDeg(deg : Float) : Vector {
    return Vector.fromRad(MathUtils.degToRad(deg));
  }

   static public function fromRad(rad : Float) : Vector {
    var x = MathUtils.round(Math.cos(rad), 7);
    var y = MathUtils.round(Math.sin(rad), 7);

    return new Vector(x,y);
  }
}
