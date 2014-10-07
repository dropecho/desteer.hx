(function ($hx_exports) { "use strict";
$hx_exports.desteer = $hx_exports.desteer || {};
var com = {};
com.dropecho = {};
com.dropecho.ai = {};
com.dropecho.ai.steering = {};
com.dropecho.ai.steering.Behaviors = $hx_exports.desteer.behaviors = function() { };
com.dropecho.ai.steering.Behaviors.seek = function(pos,target) {
	return com.dropecho.math._Vector.Vector_Impl_.from(target - pos);
};
com.dropecho.ai.steering.Behaviors.arrive = function(pos,target,arrive_radius) {
	var desired = com.dropecho.ai.steering.Behaviors.seek(pos,target);
	var distance = com.dropecho.math._Vector.Vector_Impl_.get_length(desired);
	if(distance < arrive_radius) return com.dropecho.math._Vector.Vector_Impl_.scale(desired,distance / arrive_radius);
	return desired;
};
com.dropecho.ai.steering.Behaviors.pursue = function(pos,target,target_velocity) {
	return com.dropecho.ai.steering.Behaviors.seek(pos,target);
};
com.dropecho.ai.steering.Behaviors.flee = function(pos,target) {
	return com.dropecho.math._Vector.Vector_Impl_.from(pos - target);
};
com.dropecho.ai.steering.Behaviors.evade = function(pos,target,target_velocity) {
	return com.dropecho.ai.steering.Behaviors.flee(pos,target);
};
com.dropecho.ai.steering.Behaviors.avoid = function() {
};
com.dropecho.ai.steering.Behaviors.seperate = function() {
};
com.dropecho.ai.steering.Behaviors.cohese = function() {
};
com.dropecho.ai.steering.Behaviors.align = function() {
};
com.dropecho.ai.steering.Behaviors.interpose = function(pos,target1,target2) {
	var midpoint = com.dropecho.math._Vector.Vector_Impl_._new(0,0,0);
	return com.dropecho.ai.steering.Behaviors.seek(pos,midpoint);
};
com.dropecho.ai.steering.Behaviors.wander = function() {
};
com.dropecho.math = {};
com.dropecho.math._Vector = {};
com.dropecho.math._Vector.Vector_Impl_ = function() { };
com.dropecho.math._Vector.Vector_Impl_._new = function(x,y,z) {
	return { x : x, y : y, z : z};
};
com.dropecho.math._Vector.Vector_Impl_.from = function(vec) {
	if(vec.z == null) vec.z = 0.0; else vec.z = vec.z;
	return vec;
};
com.dropecho.math._Vector.Vector_Impl_.to = function(this1) {
	return this1;
};
com.dropecho.math._Vector.Vector_Impl_.scale2 = function(scalar,vec) {
	return com.dropecho.math._Vector.Vector_Impl_.scale(vec,scalar);
};
com.dropecho.math._Vector.Vector_Impl_.scale = function(this1,scalar) {
	this1.x *= scalar;
	this1.y *= scalar;
	this1.z *= scalar;
	return com.dropecho.math._Vector.Vector_Impl_.from(this1);
};
com.dropecho.math._Vector.Vector_Impl_.get_length = function(this1) {
	return 0.0;
};
})(typeof window != "undefined" ? window : exports);
