from django.http import HttpResponse

def index(request):
    return HttpResponse("Deployment with Pipeline successfully Completed 10.0")
