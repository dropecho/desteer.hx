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

fleeDemo.entity = new PIXI.Sprite(fleeDemo.e1Texture);
fleeDemo.entity.vel = {x:0, y:0, maxVelocity: 2, maxForce: 0.5};

// center the sprite 's anchor point
fleeDemo.entity.anchor.x = 0.5;
fleeDemo.entity.anchor.y = 0.5;

// move the sprite to the center of the screen
fleeDemo.entity.position.x = 200;
fleeDemo.entity.position.y = 150;

fleeDemo.target = new PIXI.Sprite(fleeDemo.e2Texture);
fleeDemo.target.position.x = 100;
fleeDemo.target.position.y = 100;
fleeDemo.target.vel = {x:0, y:0, maxVelocity: 1.75, maxForce: 0.5};

fleeDemo.target.anchor.x = 0.5;
fleeDemo.target.anchor.y = 0.5;

fleeDemo.stage.addChild(fleeDemo.entity);
fleeDemo.stage.addChild(fleeDemo.target);

fleeDemo.animate();
