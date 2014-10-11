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
		vec *= 10.0;

		checkComponents(10, vec);
	}

	@Test
	public function scaleByScalarCommutative() {
		var vec = new Vector(1.0,1.0,1.0);
		vec = 10.0 * vec;

		checkComponents(10,vec);
	}

	@Test
	public function addScalar(){
		var vec = new Vector(1.0,1.0,1.0);
		vec += 9.0;

		checkComponents(10, vec);	
	}

	@Test
	public function addScalarCommutative(){
		var vec = new Vector(1.0,1.0,1.0);
		var vec = 9.0 + vec;
		
		checkComponents(10, vec);
	}

	@Test
	public function addVector(){
		var vec : Vector = new Vector(1.0,1.0,1.0);
		var vec2 : Vector = new Vector(9.0,9.0,9.0);

		vec += vec2;

		checkComponents(10, vec);
	}

	@Test
	public function subVector(){
		var vec : Vector = new Vector(10.0, 10.0, 10.0);
		var vec2 : Vector = new Vector(9.0, 9.0, 9.0);

		vec -= vec2;
		
		checkComponents(1.0, vec);
	}

	@Test
	public function dotProduct(){
		var vec = new Vector(2.0, 2.0);
		var vec2 = new Vector(2.0, 2.0);

		var dot = vec * vec2;
		Assert.areEqual(8, dot);
	}

	@Test
	public function crossProduct(){
		var vec = new Vector(1.0, 0, 0);
		var vec2 = new Vector(0, 1.0, 0);

		var expectedCross : Vector = new Vector(0, 0, 1.0);
		var cross : Vector = vec % vec2;

		Assert.areEqual(expectedCross.x, cross.x);
		Assert.areEqual(expectedCross.y, cross.y);
		Assert.areEqual(expectedCross.z, cross.z);
	}

	@Test
	public function equals(){
		var vec = new Vector(1.0, 0.0);
		var vec2 = new Vector(1.0, 0.0);

		Assert.isTrue(vec == vec2);
	}

	@Test function equalsCast(){
		var vec = new Vector(1.0,0.0);
		var vec2 = {x: 1.0, y: 0.0};

		Assert.isTrue(vec == vec2);
	}
	
	@Test function equalsCastCommutative(){
		var vec = new Vector(1.0,0.0);
		var vec2 = {x: 1.0, y: 0.0};

		Assert.isTrue(vec2 == vec);
	}

	@Test function notEquals(){
		var vec = new Vector(1.0, 0.0);
		var vec2 = new Vector(0.0, 0.0);

		Assert.isTrue(vec != vec2);
	}
}
