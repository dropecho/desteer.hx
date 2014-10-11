package math;

import massive.munit.Assert;
import com.dropecho.math.Vector; 

class VectorTest {

	private function testComponents(expected : Float, actual : Vector){
		Assert.areEqual(10, actual.x);
		Assert.areEqual(10, actual.y);
		Assert.areEqual(10, actual.z);
	}

	@Test
	public function scaleByScalar() {
		var vec = new Vector(1.0,1.0,1.0);
		vec *= 10.0;

		testComponents(10, vec);
	}

	@Test
	public function scaleByScalarCommutative() {
		var vec = new Vector(1.0,1.0,1.0);
		vec = 10.0 * vec;

		testComponents(10,vec);
	}

	@Test
	public function addScalarTest(){
		var vec = new Vector(1.0,1.0,1.0);
		vec += 9.0;

		testComponents(10, vec);	
	}

	@Test
	public function addScalarCommutativeTest(){
		var vec = new Vector(1.0,1.0,1.0);
		var vec = 9.0 + vec;
		
		testComponents(10, vec);
	}

	@Test
	public function addVectorTest(){
		var vec : Vector = new Vector(1.0,1.0,1.0);
		var vec2 : Vector = new Vector(9.0,9.0,9.0);

		vec += vec2;

		testComponents(10, vec);
	}
}
