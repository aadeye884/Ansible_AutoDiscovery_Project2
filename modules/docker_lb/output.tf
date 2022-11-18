output "Load_Balancer_dns" {
  value = aws_lb.UST1-alb.dns_name
}
output "Load_Balancer_zone_id" {
  value = aws_lb.UST1-alb.zone_id
}
output "Load_Balancer_arn" {
  value = aws_lb.UST1-alb.arn
}
output "tg_arn" {
  value = aws_lb_target_group.UST1-tg.arn
}