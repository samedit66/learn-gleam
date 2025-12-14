pub type Shape {
  Circle(radius: Float)
  Rectangle(weight: Float, height: Float)
  Square(side: Float)
}

const pi = 3.14159265358979323846

pub fn area(shape: Shape) -> Float {
  case shape {
    Circle(radius) -> pi *. radius *. radius
    Rectangle(weight, height) -> weight *. height
    Square(side) -> side *. side
  }
}
