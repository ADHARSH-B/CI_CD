resource "aws_alb" "alb" {
  name            = "terraform-example-alb"
#   security_groups = ["${aws_security_group.sg_terraform.id}"]
  security_groups = [aws_security_group.alb_sg.id]
  subnets         = "${aws_subnet.dev_subnet_public.*.id}"
  tags={
    Name = "terraform-example-alb"
  }
}

resource "aws_alb_target_group" "group" {
  name     = "terraform-example-alb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.dev_vpc.id}"
  stickiness {
    type = "lb_cookie"
  }
  # Alter the destination of the health check to be the login page.
  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = "${aws_alb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.group.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "attachment_1" {
  count=2
  target_group_arn = aws_alb_target_group.group.arn
  target_id        = aws_instance.newec2_v1[count.index].id
  port             = 80
}

