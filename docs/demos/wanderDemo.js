var wanderDemo = new Demo('wander', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(150, 150);

  var wander = de.steer.behaviors.wander(this.entity.rotation);
  var vec = de.steer.behaviors.seek(pos, tar, this.entity.vel.max)
    .scale(0.001);

  updateEntityVel(this.entity, vec.add(wander));
  var outsideBounds = pos.x < 0 || pos.x > 300 || pos.y < 0 || pos.y > 300;

  if(outsideBounds) {
    this.entity.x = 150;
    this.entity.y = 150;
  }
});

wanderDemo.entity = wanderDemo.createEntity(150, 150, true);

wanderDemo.stage.addChild(wanderDemo.entity);

wanderDemo.animate();
