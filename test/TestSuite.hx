import massive.munit.TestSuite;

import ai.steering.BehaviorsTest;
import math.VectorTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(ai.steering.BehaviorsTest);
		add(math.VectorTest);
	}
}
