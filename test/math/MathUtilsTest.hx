package math;

import massive.munit.Assert;
import com.dropecho.math.MathUtils;

class MathUtilsTest {

  @Test
  function DegToRad() {
    var deg = 180;
    var rad = Math.PI;

    var output = MathUtils.degToRad(deg);

    Assert.areEqual(MathUtils.round(rad,7), output);
  }

  @Test
  function RadToDeg() {
    var deg = 180;
    var rad = Math.PI;

    var output = MathUtils.radToDeg(rad);

    Assert.areEqual(deg, output);
  }

}
