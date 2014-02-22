import 'dart:html' as html;
import 'package:stagexl/stagexl.dart' as stagexl;

void main() {
  const BALL_RADIUS = 60;

  // setup canvas & stage
  var canvas = html.querySelector('#canvas-main');
  var stage = new stagexl.Stage(canvas, webGL: false, color: 0xFFCCCCCC);

  // setup renderer
  var renderLoop = new stagexl.RenderLoop();
  renderLoop.addStage(stage);

  // draw something
  var ball = new stagexl.Shape();
  var g = ball.graphics;
  g.circle(0, 0, BALL_RADIUS);
  g.fillColor(0xFFFF8080);
  stage.addChild(ball);

  // animate the ball
  var ballSpeedX = 150;
  var ballSpeedY = 150;
  stage.onEnterFrame.listen((stagexl.EnterFrameEvent evt) {
    var delta = evt.passedTime;

    // animate the ball
    ball.x += (ballSpeedX * delta);
    ball.y += (ballSpeedY * delta);

    //print('${ball.x}, ${ball.y}');

    // ball bounce
    if (ball.x <= BALL_RADIUS) {
      ballSpeedX *= -1;
      ball.x = BALL_RADIUS;
    } else if (ball.x >= (canvas.width - BALL_RADIUS)) {
      ballSpeedX *= -1;
      ball.x = canvas.width - BALL_RADIUS;
    }

    if (ball.y <= BALL_RADIUS) {
      ballSpeedY *= -1;
      ball.y = BALL_RADIUS;
    } else if (ball.y >= (canvas.height - BALL_RADIUS)) {
      ballSpeedY *= -1;
      ball.y = canvas.height - BALL_RADIUS;
    }
  });
}
