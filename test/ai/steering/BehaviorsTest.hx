package ai.steering;

import massive.munit.Assert;
import com.dropecho.ai.steering.Behaviors;
import com.dropecho.math.Vector;

class BehaviorsTest {
  @Test
  public function seek(): Void {
    var actual = Behaviors.seek(new Vector(1, 0, 0), new Vector(0, 1, 0));
    var expected = new Vector(-1, 1, 0);

    Assert.areEqual(expected.x, actual.x);
    Assert.areEqual(expected.y, actual.y);
    Assert.areEqual(expected.z, actual.z);
  }

  @Test
  public function flee(): Void {
    var actual = Behaviors.flee(new Vector(1, 0, 0), new Vector(0, 1, 0));
    var expected = new Vector(1, -1, 0);

    Assert.areEqual(expected.x, actual.x);
    Assert.areEqual(expected.y, actual.y);
    Assert.areEqual(expected.z, actual.z);
  }

  @Test
  public function interpose(): Void {
    var pos = new Vector(1, 1, 0);
    var vec1 = new Vector(0, 0, 0);
    var vec2 = new Vector(2, 0, 0);
    var actual = Behaviors.interpose(pos, vec1, vec2);

    Assert.areEqual(0.0, actual.x);
    Assert.areEqual(-1.0, actual.y);
  }

  @Test
  public function arrive() {
    var actual = Behaviors.arrive(new Vector(1, 0, 0), new Vector(0, 1, 0));
    var expected = new Vector(-1, 1, 0);
    Assert.areEqual(expected.x, actual.x);
    Assert.areEqual(expected.y, actual.y);
    Assert.areEqual(expected.z, actual.z);
  }

  @Test
  public function evade() {
    var actual = Behaviors.evade(
                   new Vector(0, 0, 0),
                   new Vector(2, 0, 0),
                   new Vector(-4, 0, 0));
    Assert.areEqual(-1.0, actual.x);
    Assert.areEqual(0.0, actual.y);
  }

  @Test
  public function pursue() {
    var actual = Behaviors.pursue(
                   new Vector(0, 0, 0),
                   new Vector(1, 0, 0),
                   new Vector(4, 0, 0));
    Assert.areEqual(2.0, actual.x);
    Assert.areEqual(0.0, actual.y);
  }

  @Test
  public function seperate() {
    var pos = new Vector(0, 0, 0);
    var e1 = new Vector(-1, 0, 0);
    var e2 = new Vector(1, 0, 0);
    var entities = [pos, e1, e2];
    var actual = Behaviors.seperate(pos, entities);
    Assert.areEqual(0.0, actual.x);
    Assert.areEqual(0.0, actual.y);
  }

}
