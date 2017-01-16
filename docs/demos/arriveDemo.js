var arriveDemo = new Demo('arrive', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);

  var vec = de.steer.behaviors.arrive(pos, tar, 20, this.entity.vel.maxVelocity);
  updateEntityVel(this.entity, vec);

  if(pos.distanceFrom(tar) < 10){
    this.target.x = Math.random() * (this.renderer.width);
    this.target.y = Math.random() * (this.renderer.height);
  }
});

arriveDemo.entity = arriveDemo.createEntity(250, 150, true);
arriveDemo.target = arriveDemo.createEntity(100, 100, false);

arriveDemo.stage.addChild(arriveDemo.entity);
arriveDemo.stage.addChild(arriveDemo.target);

arriveDemo.animate();
