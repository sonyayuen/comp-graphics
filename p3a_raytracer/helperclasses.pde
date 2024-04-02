public class Ray {
  
  PVector origin;
  PVector direction;
  
  public Ray(PVector origin, PVector direction) {
    this.origin = origin;
    this.direction = direction;
  }
  
  //Given a t value, compute R(t) = o + t * d
  public PVector at(float t) {
    return PVector.add(this.origin, PVector.mult(this.direction, t));
  }
  
  public PVector getDirection(){
    
   return direction; 
  }
}

public class Material {
  PVector difColor;
  PVector ambColor;
  PVector specColor;
  float specPow;
  float kRefl;
  
  public Material(PVector difColor, PVector ambColor, PVector specColor, float specPow, float kRefl) {
    this.difColor = difColor;
    this.ambColor = ambColor;
    this.specColor = specColor;
    this.specPow = specPow;
    this.kRefl = kRefl;
  }
}

public class Light {
  PVector pos;
  PVector col;
  
  public Light(PVector pos, PVector col) {
    this.pos = pos;
    this.col = col;
  } 
}

/* Upon a ray hitting the shape, store the calculated root (t-value),
 * the actual intersection point for the ray and the shape, the normal vector,
 * and the shape that was hit (for shading purposes)
 */
public class Hit {
  PVector norm;
  PVector interPoint;
  float t;
  Shape hitShape;
  
  public Hit(float t, PVector interPoint, PVector norm, Shape hitShape) {
    this.t = t;
    this.interPoint = interPoint;
    this.norm = norm;
    this.hitShape = hitShape;
  }
  
  
  
  
  
}

//Parent class for Sphere and Triangle
public abstract class Shape {
  Material mat;
  
  public Shape(Material mat) {
    this.mat = mat;
  }
  
  public abstract Hit intersectRay(Ray ray);
}

public class Sphere extends Shape {
  float radius;
  PVector center;
  Material mat;
  
  public Sphere(float radius, PVector center, Material mat) {
    super(mat);
    this.radius = radius;
    this.center = center;
  }
  
  public Hit intersectRay(Ray ray) {
    // Check if the ray is intersecting with the given sphere. Returns null if no intersection.
    // ===== (TODO) Stage 3b begins =======
    
    
    float tPos;
    float tNeg;
    float t;
    /// sy:     shape.intersectRay()
    
    //Get vector from the center to the origin
    PVector origRelCenter = PVector.sub(ray.origin, this.center);
    
    // First, you need to calculate quadratic coefficients
    float a = pow(ray.direction.x, 2.0) + pow(ray.direction.y,2.0) + pow(ray.direction.z, 2.0) ; //dx^2 + dy^2 + dz^2
    float b = (2.0 * ray.direction.x  * origRelCenter.x) +  (2.0 * ray.direction.y  * origRelCenter.y) + (2.0 * ray.direction.z  * origRelCenter.z) ; //2dxUx + 2dyUy + 2dzUz
    float c = pow(origRelCenter.x, 2.0) + pow(origRelCenter.y, 2.0)  + pow(origRelCenter.z, 2.0) - pow(this.radius, 2.0); //Ux^2 +Uy^2 +Ux^2 - r^2
    
    // You need to compute discriminant and handles the cases properly. Returns null if there is no colission.
    float discriminant = pow(b,2.0) - (4.0 * a * c); //b^2-4ac
    
    if (discriminant < 0) { //if negative, ray did not hit sphere
     return null; 
    } else {
      tPos = (-b + sqrt(discriminant)) /(2.0 * a);
      tNeg = (-b - sqrt(discriminant)) / (2.0 * a);
      
      if (tPos > 0 && tNeg > 0) { //if both are positive take smallest positive val
        t = min(tPos, tNeg);
      } else if ( tPos >= 0 && tNeg < 0) { //if one pos one neg, choose pos
        t = tPos;
      } else if (tPos < 0 && tNeg >= 0) {
        t = tNeg;
      } else { //if both neg
        return null;
      }  
    }   
    
    // Compute two "t" values, and return the smallest positive out of the two.
    
    PVector intersectionPoint = ray.at(t);  // compute the intersection point using Ray equation. (hint: use Ray.at function)
    PVector sphereNorm = PVector.sub(intersectionPoint, this.center); // If you know the collision point, you can compare it against the center of the sphere to compute the norm. Don't forget to normalize this before return.
    sphereNorm.normalize();
    // ===== (TODO) Stage 3b ends =======
    
    return new Hit(t, intersectionPoint, sphereNorm, this);
  }
  
}
