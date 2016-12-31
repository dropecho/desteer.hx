var fleeDemo = new Demo('flee', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);

  var vec = de.steer.behaviors.seek(pos, tar, this.entity.vel.max);
  updateEntityVel(this.entity, vec);

  var fleeVec = de.steer.behaviors.flee(tar, pos, 75).scale(0.05);
  updateEntityVel(this.target, fleeVec);

  var outsideBounds = tar.x < 0 || tar.x > 300 || tar.y < 0 || tar.y > 300;

  if(pos.distanceFrom(tar) < 10 || outsideBounds){
    this.target.x = Math.random() * (this.renderer.width / 2);
    this.target.y = Math.random() * (this.renderer.height / 2);
  }
});

fleeDemo.entity = fleeDemo.createEntity(250, 150, false);
fleeDemo.target = fleeDemo.createEntity(100, 100, true);

fleeDemo.stage.addChild(fleeDemo.entity);
fleeDemo.stage.addChild(fleeDemo.target);

fleeDemo.animate();
