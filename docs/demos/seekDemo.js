var seekDemo = new Demo('seek', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);

  var vec = de.steer.behaviors.seek(pos, tar, this.entity.vel.max);
  updateEntityVel(this.entity, vec);

  if(pos.distanceFrom(tar) < 25){
    this.target.x = Math.random() * (this.renderer.width / 2);
    this.target.y = Math.random() * (this.renderer.height / 2);
  }
});

seekDemo.entity = new PIXI.Sprite(seekDemo.e1Texture);
seekDemo.entity.vel = {x:0, y:0, maxVelocity: 3, maxForce: 0.5};

// center the sprite 's anchor point
seekDemo.entity.anchor.x = 0.5;
seekDemo.entity.anchor.y = 0.5;

// move the sprite to the center of the screen
seekDemo.entity.position.x = 200;
seekDemo.entity.position.y = 150;

seekDemo.target = new PIXI.Sprite(seekDemo.e2Texture);
seekDemo.target.position.x = 100;
seekDemo.target.position.y = 100;

seekDemo.stage.addChild(seekDemo.entity);
seekDemo.stage.addChild(seekDemo.target);

seekDemo.animate();
