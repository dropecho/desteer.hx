/**
 * Demo
 *
 * @access public
 * @param {string} id Id for dom element to render to
 * @param {function} frameCallback Function to be called every animation frame
 */
function Demo(id, frameCallback) {
  this.renderer = PIXI.autoDetectRenderer(300, 300, { backgroundColor: 0x1099bb });
  document.querySelector('#' + id).appendChild(this.renderer.view);

  // create the root of the scene graph
  this.stage = new PIXI.Container();

  // create a texture from an image path
  this.e1Texture = PIXI.Texture.fromImage('assets/v1-small.png');
  this.e2Texture = PIXI.Texture.fromImage('assets/v2-small.png');
  this.gridTexture = PIXI.Texture.fromImage('assets/grid-small.png');
  this.targetTexture = PIXI.Texture.fromImage('assets/target.png');

  this.background = new PIXI.TilingSprite(
    this.gridTexture, this.renderer.width, this.renderer.height);

  this.stage.addChild(this.background);
  // start animating
  this.frameCallback = frameCallback;
}

Demo.prototype.animate = function animate() {
  requestAnimationFrame(animate.bind(this));
  // just for fun, let's rotate mr rabbit a little
  this.frameCallback();

  // render the container
  this.renderer.render(this.stage);
};

/**
 * updateEntityVel
 *
 * @access public
 * @param {Entity} entity
 * @param {de.math.Vector} vec
 */
function updateEntityVel(entity, vec){
  var vel = new de.math.Vector(entity.vel.x, entity.vel.y);
  var steering = de.math.Vector.sub2(vec, vel).truncate(entity.vel.maxForce);

  vel.add(steering).truncate(entity.vel.maxVelocity);
  entity.vel.x = vel.x;
  entity.vel.y = vel.y;

  entity.x += vel.x;
  entity.y += vel.y;

  entity.rotation = vel.toRad();
}


