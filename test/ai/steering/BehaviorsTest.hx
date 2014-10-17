package ai.steering;

import massive.munit.Assert;
import com.dropecho.ai.steering.Behaviors;

class BehaviorsTest
{
	@Test
	public function seek():Void
	{
		var actual = Behaviors.seek({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:-1.0, y:1.0} == actual);
	}
	
	@Test
	public function flee():Void
	{
		var actual = Behaviors.flee({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:1.0, y:-1.0} == actual);
	}
	
	@Test
	public function interpose():Void
	{
		var pos = {x:1.0, y:1.0};
		var vec1 = {x:0.0,y:0.0};
		var vec2 = {x:2.0,y:0.0};
		var actual = Behaviors.interpose(pos, vec1, vec2);
		
		Assert.areEqual(0.0, actual.x);
		Assert.areEqual(-1.0, actual.y);
	}

	@Test
	public function arrive()
	{
		var actual = Behaviors.arrive({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:-1.0, y:1.0} == actual);
	}

	@Test function evade(){
		var actual = Behaviors.evade({x:0.0,y:0.0},{x:2.0,y:0.0},{x:-4.0,y:0.0});
		
		Assert.areEqual(-1.0, actual.x);
		Assert.areEqual(0.0, actual.y);
	}

	@Test function pursue(){
		var actual = Behaviors.pursue({x:0.0,y:0.0},{x:1.0,y:0.0},{x:4.0,y:0.0});
		
		Assert.areEqual(2.0, actual.x);
		Assert.areEqual(0.0, actual.y);
	}
}	
