output "Load_Balancer_dns" {
  value = aws_lb.EFG-alb.dns_name
}
output "Load_Balancer_zone_id" {
  value = aws_lb.EFG-alb.zone_id
}
output "Load_Balancer_arn" {
  value = aws_lb.EFG-alb.arn
}
output "tg_arn" {
  value = aws_lb_target_group.EFG-tg.arn
}