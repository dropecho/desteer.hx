package math;

import massive.munit.Assert;
import com.dropecho.math.Vector; 

class VectorTest {
	private function checkComponents(expected : Float, actual : Vector){
		Assert.areEqual(expected, actual.x);
		Assert.areEqual(expected, actual.y);
		Assert.areEqual(expected, actual.z);
	}

	@Test
	public function scaleByScalar() {
		var vec = new Vector(1.0,1.0,1.0);
		vec.scale(10.0);

		checkComponents(10, vec);
	}

	@Test
	public function addVector(){
		var vec : Vector = new Vector(1.0,1.0,1.0);
		var vec2 : Vector = new Vector(9.0,9.0,9.0);

		vec = vec.add(vec2);

		checkComponents(10, vec);
	}

	@Test
	public function subVector(){
		var vec : Vector = new Vector(10.0, 10.0, 10.0);
		var vec2 : Vector = new Vector(9.0, 9.0, 9.0);

		vec = vec.sub(vec2);
		
		checkComponents(1.0, vec);
	}

	@Test
	public function dotProduct(){
		var vec = new Vector(2.0, 2.0);
		var vec2 = new Vector(2.0, 2.0);

		var dot = vec.dot(vec2);
		Assert.areEqual(8, dot);
	}

	@Test
	public function crossProduct(){
		var vec = new Vector(1.0, 0, 0);
		var vec2 = new Vector(0, 1.0, 0);

		var expectedCross : Vector = new Vector(0, 0, 1.0);
		var cross : Vector = vec.cross(vec2);

		Assert.areEqual(expectedCross.x, cross.x);
		Assert.areEqual(expectedCross.y, cross.y);
		Assert.areEqual(expectedCross.z, cross.z);
	}

	@Test function midpoint() {
		var vec = new Vector(1.0, 1.0, 1.0);
		var vec2 = new Vector(0.0, 0.0, 0.0);

		var mid = Vector.midpoint(vec,vec2);
		
		checkComponents(0.5, mid);
	}

  @Test function fromDeg(){
    var deg = 0;
    var vec2 = new Vector(1,0,0); 

    var heading = Vector.fromDeg(deg);

		Assert.areEqual(heading.x, vec2.x);
		Assert.areEqual(heading.y, vec2.y);
		Assert.areEqual(heading.z, vec2.z);
  }

  @Test function fromDeg2(){
    var deg = 90;
    var vec2 = new Vector(0,1,0); 

    var heading = Vector.fromDeg(deg);

		Assert.areEqual(heading.x, vec2.x);
		Assert.areEqual(heading.y, vec2.y);
		Assert.areEqual(heading.z, vec2.z);
  }
}
