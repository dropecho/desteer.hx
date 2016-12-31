var seekDemo = new Demo('seek', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);

  var vec = de.steer.behaviors.seek(pos, tar, this.entity.vel.max);
  updateEntityVel(this.entity, vec);

  if(pos.distanceFrom(tar) < 5){
    this.target.x = Math.random() * (this.renderer.width / 2);
    this.target.y = Math.random() * (this.renderer.height / 2);
  }
});

seekDemo.entity = seekDemo.createEntity(250, 150, true);
seekDemo.target = seekDemo.createEntity(100, 100, false);

seekDemo.stage.addChild(seekDemo.entity);
seekDemo.stage.addChild(seekDemo.target);

seekDemo.animate();
