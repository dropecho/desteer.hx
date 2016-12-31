var pursueDemo = new Demo('pursue', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);
  var tarVel = new de.math.Vector(this.target.vel.x, this.target.vel.y);

  var vec = de.steer.behaviors.pursue(pos, tar, tarVel, 100);
  updateEntityVel(this.entity, vec);

  var forward = de.math.Vector
    .fromRad(this.target.rotation)
    .scale(3);
  var turn = de.math.Vector
    .fromRad(this.target.rotation + (Math.PI/2))
    .scale(0.1);

  updateEntityVel(this.target, forward.add(turn));

  var outsideBounds = tar.x < 0 || tar.x > 300 || tar.y < 0 || tar.y > 300;

  if(pos.distanceFrom(tar) < 15 || outsideBounds){
    this.target.x = Math.random() * (this.renderer.width / 2);
    this.target.y = Math.random() * (this.renderer.height / 2);
  }
});

pursueDemo.entity = pursueDemo.createEntity(200, 150, true);
pursueDemo.target = pursueDemo.createEntity(100, 100, false);

pursueDemo.stage.addChild(pursueDemo.entity);
pursueDemo.stage.addChild(pursueDemo.target);

pursueDemo.animate();
