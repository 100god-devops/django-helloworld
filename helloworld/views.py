from django.http import HttpResponse

def index(request):
    return HttpResponse("Deployment with Pipeline successfully Completed with EKS ALB Ingress Service Rollback Deloyments Test")
