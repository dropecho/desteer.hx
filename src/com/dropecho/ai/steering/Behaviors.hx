package com.dropecho.ai.steering;
import com.dropecho.math.Vector;

@:expose("desteer.behaviors")
class Behaviors {
	static public function seek(pos : Vector, target : Vector) : Vector {
		return target - pos;
	}

	static public function arrive(
			pos : Vector, 
			target : Vector,
			arrive_radius : Float) : Vector 
	{
		var desired = seek(pos, target);
		var distance = desired.length;

		if(distance < arrive_radius) {
			return (distance / arrive_radius) * desired;
		}

		return desired;
	}

	static public function pursue (
			pos : Vector, 
			target : Vector,
			target_velocity : Vector) : Vector 
	{
		return seek(pos, target);
	}

	static public function flee(pos : Vector, target : Vector) : Vector {
		return pos - target;
	}

	static public function evade(
			pos : Vector, 
			target : Vector,
			target_velocity : Vector) : Vector 
	{
		return flee(pos, target);
	}

	static public function avoid(){
	}

	static public function seperate(){
	}

	static public function cohese(){
	}

	static public function align(){
	}

	static public function interpose(pos : Vector, target1 : Vector, target2 : Vector) : Vector {
		//find midpoint;
		var midpoint = new Vector(0,0,0);
		return seek(pos, midpoint);
	}


	static public function wander(){
	}
}
