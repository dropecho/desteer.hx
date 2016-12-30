var pursueDemo = new Demo('pursue', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar = new de.math.Vector(this.target.x, this.target.y);
  var tarVel = new de.math.Vector(this.target.vel.x, this.target.vel.y);

  var vec = de.steer.behaviors.pursue(pos, tar, tarVel, 50);
  updateEntityVel(this.entity, vec);

  // var pursueVec = de.steer.behaviors.flee(tar, pos, 75).scale(0.05);
  // var turnVec = de.math.Vector.fromRad(pursueVec.toRad() + Math.PI);
  // console.log(pursueVec, turnVec);
  // updateEntityVel(this.target, pursueVec.add(turnVec));
  
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

pursueDemo.entity = new PIXI.Sprite(pursueDemo.e1Texture);
pursueDemo.entity.vel = {x:0, y:0, maxVelocity: 3, maxForce: 0.5};

// center the sprite 's anchor point
pursueDemo.entity.anchor.x = 0.5;
pursueDemo.entity.anchor.y = 0.5;

// move the sprite to the center of the screen
pursueDemo.entity.position.x = 200;
pursueDemo.entity.position.y = 150;

pursueDemo.target = new PIXI.Sprite(pursueDemo.e2Texture);
pursueDemo.target.position.x = 100;
pursueDemo.target.position.y = 100;
pursueDemo.target.vel = {x:0, y:0, maxVelocity: 4, maxForce: 0.5};

pursueDemo.target.anchor.x = 0.5;
pursueDemo.target.anchor.y = 0.5;

pursueDemo.stage.addChild(pursueDemo.entity);
pursueDemo.stage.addChild(pursueDemo.target);

pursueDemo.animate();
