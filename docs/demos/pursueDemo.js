var pursueDemo = new Demo('pursue', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);
  var tarVel = new de.math.Vector(this.target.vel.x, this.target.vel.y);
  var center = new de.math.Vector(150, 150);

  var vec = de.steer.behaviors.pursue(pos, tar, tarVel, 10);
  updateEntityVel(this.entity, vec);
  
  var wander = de.steer.behaviors.wander(this.target.rotation, 1);
  var seek = de.steer.behaviors.seek(tar, center).scale(0.0025);

  updateEntityVel(this.target, seek.add(wander));

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
