provider "helm" {
  kubernetes {
    config_path = "/tmp/kubeconfig"
  }
}



resource "helm_release" "nginx_ingress" {
  depends_on = [time_sleep.wait_1min]
  name       = "nginx-ingress-controller"

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx-ingress-controller"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}