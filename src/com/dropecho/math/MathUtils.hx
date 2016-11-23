package com.dropecho.math;

@:expose('de.math.Utils')
class MathUtils {
  public static function radToDeg(rad : Float) : Float {
    return MathUtils.round((rad * 180) / Math.PI, 7);
  }

  public static function degToRad(deg : Float) : Float {
    return MathUtils.round((deg * Math.PI) / 180, 7);
  }

  public static function round(number:Float, ?precision=2): Float
  {
    var p = Math.pow(10, precision);
    number *= p; 
    return Math.round(number) / p;
  }
}

