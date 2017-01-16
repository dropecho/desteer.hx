var interposeDemo = new Demo('interpose', function() {
  var pos = new de.math.Vector(this.entity.x, this.entity.y);
  var tar1 = new de.math.Vector(this.target1.x, this.target1.y);
  var tar2 = new de.math.Vector(this.target2.x, this.target2.y);

  var vec = de.steer.behaviors.interpose(pos, tar1, tar2);
  updateEntityVel(this.entity, vec);

  var forward = de.math.Vector
    .fromRad(this.target1.rotation)
    .scale(3);

  var wander = de.math.Vector
    .fromRad(this.target1.rotation + (Math.random() - .5))
    .scale(.0001);

  var turn1 = de.math.Vector
    .fromRad(this.target1.rotation + (Math.PI/2))
    .scale(0.1);

  var forward2 = de.math.Vector
    .fromRad(this.target2.rotation)
    .scale(2);

  var turn2 = de.math.Vector
    .fromRad(this.target2.rotation + (Math.PI/2))
    .scale(0.1);


  updateEntityVel(this.target1, forward.add(turn1).add(wander));
  updateEntityVel(this.target2, forward2.add(turn2).scale(0.5));
});

interposeDemo.entity = interposeDemo.createEntity(200, 150, true);
interposeDemo.target1 = interposeDemo.createEntity(150, 50, false);
interposeDemo.target2 = interposeDemo.createEntity(150, 100, false);

interposeDemo.stage.addChild(interposeDemo.entity);
interposeDemo.stage.addChild(interposeDemo.target1);
interposeDemo.stage.addChild(interposeDemo.target2);

interposeDemo.animate();
