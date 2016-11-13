package com.dropecho.ai.steering;
import com.dropecho.math.Vector;

@:expose("desteer.behaviors")
class Behaviors {
	static public function seek(pos : Vector, target : Vector) : Vector {
		return target.sub(pos);
	}

	static public function arrive(
			pos : Vector, 
			target : Vector,
			arrive_radius : Float = 0) : Vector 
	{
		var desired = seek(pos, target);
		var distance = desired.length;

		if(distance < arrive_radius) {
			return desired.scale(distance / arrive_radius);
		}

		return desired;
	}

	static private function predict_target_pos(
			target:Vector, 
			target_velocity: Vector,
			look_ahead: Float) : Vector {
		return target.add(target_velocity.scale(look_ahead));
	}

	static public function pursue (
			pos : Vector, 
			target : Vector,
			target_velocity : Vector,
			look_ahead:Float = .25) : Vector 
	{
		var predicted = predict_target_pos(target, target_velocity, look_ahead); 
		return seek(pos, predicted);
	}

	static public function flee(pos : Vector, target : Vector) : Vector {
		return pos.sub(target);
	}

	static public function evade(
			pos : Vector, 
			target : Vector,
			target_velocity : Vector,
			look_ahead : Float = .25) : Vector 
	{
		var predicted = predict_target_pos(target, target_velocity, look_ahead); 
		return flee(pos, predicted);
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
		var midpoint = Vector.midpoint(target1, target2);
		return arrive(pos, midpoint);
	}

	static public function wander(){
	}
}
