-- Q16.2 Create a Shape type that includes the following shapes: Circle, Square, and Rectangle.
--   Then write a function to compute the perimeter of a Shape as well as its area.

data Circle = Circle {
  circleRadius :: Double
}
data Square = Square {
  squareLength :: Double
}
data Rectangle = Rectangle {
  rectangleLength :: Double,
  rectangleHeight :: Double
}

data Shape = CircleShape Circle | SquareShape Square | RectangleShape Rectangle

circle :: Circle
circle = Circle { circleRadius = 2 }
square :: Square
square = Square {squareLength = 2}
rectangle :: Rectangle
rectangle = Rectangle {
  rectangleLength = 2,
  rectangleHeight = 3
}

getArea :: Shape -> Double
getArea (CircleShape circle) = 3.14 * (circleRadius circle) ^ 2 / 2
getArea (SquareShape square) = (squareLength square) ^ 2
getArea (RectangleShape rectangle) = (rectangleLength rectangle) * (rectangleHeight rectangle)

getPerimeter :: Shape -> Double
getPerimeter (CircleShape circle) = 2 * 3.14 * (circleRadius circle)
getPerimeter (SquareShape square) = 4 * (squareLength square)
getPerimeter (RectangleShape rectangle) = 2 * (rectangleLength rectangle) + 2 * (rectangleHeight rectangle)
