package com.dropecho.ai.steering;
import com.dropecho.math.Vector;

@:expose("de.steer.behaviors")
class Behaviors {
  static public function seek(
    pos : Vector, 
    target : Vector, 
    maxVelocity : Float = 0) : Vector
  {
    var desired = Vector.sub2(target, pos);
    return maxVelocity == 0 ? desired : desired.normalize(maxVelocity);
  }

  static public function arrive(
    pos : Vector,
    target : Vector,
    arriveRadius : Float = 0,
    maxVelocity: Float = 0) : Vector
  {
    var desired = seek(pos, target, maxVelocity);
    var distance = Vector.sub2(pos, target).length;

    if (distance < arriveRadius) {
      var scaleRatio = distance / arriveRadius;
      return desired.scale(scaleRatio);
    }

    return desired;
  }

  static public function pursue(
    pos : Vector,
    target : Vector,
    target_velocity : Vector,
    look_ahead: Float = .25) : Vector
  {
    var predicted = predict_target_pos(target, target_velocity, look_ahead);
    return seek(pos, predicted);
  }

  static public function flee(
    pos : Vector, 
    target : Vector, 
    fleeRadius: Float = -1) : Vector
  {
    var shouldFlee = fleeRadius != -1 && fleeRadius >= target.distanceFrom(pos);
    return shouldFlee ? Vector.sub2(pos, target) : new Vector(0,0,0);
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

  static public function avoid() {
  }

  static public function seperate(
    pos: Vector, 
    neighbors: Array<Vector>, 
    amount: Float = 128.0) : Vector
  {
    var seperationForce = new Vector();

    for (n in neighbors) {
      var awayFromNeighbor = Vector.sub2(pos,n);
      var distanceToNeighbor = awayFromNeighbor.length;

      //if self
      if(distanceToNeighbor == 0){
        continue;
      }
      seperationForce.add(awayFromNeighbor.normalize().scale(128 / distanceToNeighbor));
    }

    return seperationForce;
  }

  static public function cohese(pos: Vector, neighbors: Array<Vector>, maxSpeed: Float) : Vector {
    var centerOfMass = new Vector();
    var neighborCount = neighbors.length;

    for (n in 0...neighborCount) {
      centerOfMass.add(neighbors[n]);
    }

    if (neighborCount > 0) {
      centerOfMass.scale(1 / neighborCount);
      return Behaviors.arrive(pos, centerOfMass, maxSpeed);
    }

    return new Vector();
  }

  static public function align(heading: Vector, neighborHeadings: Array<Vector>) {
    var averageHeading = new Vector();
    var neighborCount = neighborHeadings.length;

    for (n in 0...neighborCount) {
      averageHeading.add(neighborHeadings[n]);
    }

    if (neighborCount > 0) {
      averageHeading.scale(1 / neighborCount);
      averageHeading.sub(heading);
    }

    return averageHeading;
  }

  static public function interpose(pos : Vector, target1 : Vector, target2 : Vector) : Vector {
    var midpoint = Vector.midpoint(target1, target2);
    return arrive(pos, midpoint);
  }

  static public function wander() {
  }

  static private function predict_target_pos(
    target: Vector,
    target_velocity: Vector,
    look_ahead: Float) : Vector {
    return Vector.add2(target, Vector.scale2(target_velocity, look_ahead));
  }
}
