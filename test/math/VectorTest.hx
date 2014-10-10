package math;

import massive.munit.Assert;
import com.dropecho.math.Vector; 

class VectorTest {

	@Test
	public function scaleByScalar() {
		var vec = new Vector(1.0,1.0,1.0);
		vec *= 10;

		Assert.areEqual(10, vec.x);
		Assert.areEqual(10, vec.y);
		Assert.areEqual(10, vec.z);
	}

	@Test
	public function addScalarTest(){
		var vec = new Vector(1.0,1.0,1.0);
		vec += 9.0;
	
		Assert.areEqual(10, vec.x);
		Assert.areEqual(10, vec.y);
		Assert.areEqual(10, vec.z);
	}

	@Test
	public function addVectorTest(){
		var foo = new Vector(1.0,1.0,1.0);
		var vec2 = new Vector(9.0,9.0,9.0);

		var vec = foo + vec2;

		Assert.areEqual(10, vec.x);
		Assert.areEqual(10, vec.y);
		Assert.areEqual(10, vec.z);
		
	}
}
