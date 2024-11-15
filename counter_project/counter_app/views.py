from django.shortcuts import render
from .models import Counter

def counter_view(request):
    counter, _ = Counter.objects.get_or_create(id=1)
    if request.method == 'POST':
        counter.value += 1
        counter.save()
    return render(request, 'counter.html', {'counter': counter})
