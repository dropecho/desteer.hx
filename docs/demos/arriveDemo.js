var arriveDemo = new Demo('arrive', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);

  var vec = de.steer.behaviors.seek(pos, tar, 200, this.entity.vel.max);
  updateEntityVel(this.entity, vec);

  if(pos.distanceFrom(tar) < 25){
    this.target.x = Math.random() * (this.renderer.width / 2);
    this.target.y = Math.random() * (this.renderer.height / 2);
  }
});

arriveDemo.entity = new PIXI.Sprite(arriveDemo.e1Texture);
arriveDemo.entity.vel = {x:0, y:0, maxVelocity: 3, maxForce: 0.5};

// center the sprite 's anchor point
arriveDemo.entity.anchor.x = 0.5;
arriveDemo.entity.anchor.y = 0.5;

// move the sprite to the center of the screen
arriveDemo.entity.position.x = 200;
arriveDemo.entity.position.y = 150;

arriveDemo.target = new PIXI.Sprite(arriveDemo.e2Texture);
arriveDemo.target.position.x = 100;
arriveDemo.target.position.y = 100;

arriveDemo.stage.addChild(arriveDemo.entity);
arriveDemo.stage.addChild(arriveDemo.target);

arriveDemo.animate();
