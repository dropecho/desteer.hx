var flockDemo = new Demo('flock', function() {
  let ents = this.entities.map(e => new de.math.Vector(e.x, e.y));
  let entHeadings = this.entities.map(e => de.math.Vector.fromRad(e.rotation));
  let center = new de.math.Vector(this.renderer.width/2, this.renderer.height/2);

  this.entities.forEach(e => {
    let pos = new de.math.Vector(e.x, e.y);
    let rot = de.math.Vector.fromRad(e.rotation);
    let seperate = de.steer.behaviors.seperate(pos, ents).scale(0.05);
    let cohese = de.steer.behaviors.cohese(pos, ents).scale(0.01);
    let align = de.steer.behaviors.align(rot, entHeadings).scale(0.0125);
    let forward = de.math.Vector.fromRad(e.rotation);

    let seek = de.steer.behaviors.seek(pos, center).scale(0.0001);

    updateEntityVel(e, seperate.add(align).add(cohese).add(forward).add(seek));
  });
});

flockDemo.entities = [];

for(var i = 0; i < 10; i++){
  var x = Math.random() * (flockDemo.renderer.width / 2);
  var y = Math.random() * (flockDemo.renderer.height / 2);
  createEntity(x, y);
}

function createEntity(x,y){
  var entity = new PIXI.Sprite(flockDemo.e1Texture);
  entity.vel = {x:0, y:0, maxVelocity: 3, maxForce: 0.5};

  // center the sprite 's anchor point
  entity.anchor.x = 0.5;
  entity.anchor.y = 0.5;

  // move the sprite to the center of the screen
  entity.position.x = x;
  entity.position.y = y;

  flockDemo.entities.push(entity);

  flockDemo.stage.addChild(entity);
}

flockDemo.animate();
