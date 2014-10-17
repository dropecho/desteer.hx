package ai.steering;

import massive.munit.Assert;
import com.dropecho.ai.steering.Behaviors;

class BehaviorsTest
{
	@Test
	public function seek():Void
	{
		var foo = Behaviors.seek({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:-1.0, y:1.0} == foo);
	}
	
	@Test
	public function flee():Void
	{
		var foo = Behaviors.flee({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:1.0, y:-1.0} == foo);
	}
	
	@Test
	public function interpose():Void
	{
		var pos = {x:1.0, y:1.0};
		var vec1 = {x:0.0,y:0.0};
		var vec2 = {x:2.0,y:0.0};
		var foo = Behaviors.interpose(pos, vec1, vec2);
		
		Assert.areEqual(0.0, foo.x);
		Assert.areEqual(-1.0, foo.y);
	}

	@Test
	public function arrive()
	{
		var foo = Behaviors.arrive({x:1.0,y:0.0},{x:0.0,y:1.0});
		
		Assert.isTrue({x:-1.0, y:1.0} == foo);
	}

	@Test function evade(){
		var foo = Behaviors.evade({x:0.0,y:0.0},{x:2.0,y:0.0},{x:-4.0,y:0.0});
		
		Assert.areEqual(-1.0, foo.x);
		Assert.areEqual(0.0, foo.y);
	}
}	
