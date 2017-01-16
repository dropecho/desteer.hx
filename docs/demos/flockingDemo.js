var flockDemo = new Demo('flock', function() {
  let ents = this.entities.children.map(e => new de.math.Vector(e.x, e.y));
  let entHeadings = this.entities.children.map(e => de.math.Vector.fromRad(e.rotation));
  let center = new de.math.Vector(this.renderer.width/2, this.renderer.height/2);

  this.entities.children.forEach(e => {
    let pos = new de.math.Vector(e.x, e.y);
    let forward = de.math.Vector.fromRad(e.rotation).scale(0.5);
    let seperate = de.steer.behaviors.seperate(pos, ents).scale(0.01);
    let cohese = de.steer.behaviors.cohese(pos, ents).scale(0.01);
    let align = de.steer.behaviors.align(forward, entHeadings).scale(0.015);
    let wander = de.steer.behaviors.wander(e.rotation).scale(0.25);

    let seek = de.steer.behaviors.seek(pos, center).scale(0.0001);

    updateEntityVel(e, seperate
        .add(align)
        .add(cohese)
        .add(forward)
        .add(seek)
        .add(wander));
  });
});

flockDemo.entities = new PIXI.DisplayObjectContainer();
flockDemo.stage.addChild(flockDemo.entities);

for(var i = 0; i < 100; i++){
  var x = Math.random() * (flockDemo.renderer.width / 2);
  var y = Math.random() * (flockDemo.renderer.height / 2);
  var e = flockDemo.createEntity(x, y);
  flockDemo.entities.addChild(e);
}

flockDemo.entities.scale.x = 0.5;
flockDemo.entities.scale.y = 0.5;

flockDemo.animate();
