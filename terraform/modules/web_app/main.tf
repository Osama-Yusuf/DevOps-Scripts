resource "aws_elb" "web_app" {
  name            = "${var.web_app}-web"
  subnets         = var.subnets
  security_groups = var.security_groups

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  tags  = {
    "Terraform" : "true"
  }
}

resource "aws_launch_template" "web_app" {
  name_prefix   = "${var.web_app}-web"
  image_id      = var.image_id
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "web_app" {
  # availability_zones  = ["us-west-2a", "us-west-2b"]
  vpc_zone_identifier = var.subnets
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size

  launch_template {
    id      = aws_launch_template.web_app.id
    version = "$Latest"
  }
  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true   # which means assign this key when a new instance is launched
  }
}

# Create a new auto scaling attachement to connecgt the ELB to the ASG
resource "aws_autoscaling_attachment" "web_app" {
  autoscaling_group_name = aws_autoscaling_group.web_app.id
  elb                    = aws_elb.web_app.id
}
