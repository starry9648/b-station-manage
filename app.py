from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from bstation.models import Video  # 假设你有一个 Video 模型用于存储视频信息
import json
from django.http import JsonResponse
from django.db import IntegrityError
from django.apps import AppConfig
from django.apps import AppConfig



class BstationConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'bstation'
def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('video_management:home')
        else:
            return render(request, 'login.html', {'error': '用户名或密码错误'})
    return render(request, 'login.html')
# def home(request):
#     if request.user.is_authenticated:
#         return render(request, 'layout.html')
#     return redirect('video_management:user_login')
def home(request):
    return redirect('video_management:user_login')

def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')

        if not username or not email or not password:
            return render(request, 'register.html', {'error': '注册失败，请填写所有必填字段'})

        try:
            user = User.objects.create_user(username=username, email=email, password=password)
            login(request, user)
            return redirect('video_management:home')
        except IntegrityError:
            return render(request, 'register.html', {'error': '注册失败，用户名可能已存在，请重试'})
    return render(request, 'register.html')

from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _

def add(request):
    if request.method == 'POST':
        bvid = request.POST.get('bvid')
        title = request.POST.get('title')
        author_mid = request.POST.get('author_mid')
        pub_time = request.POST.get('pub_time')
        duration = request.POST.get('duration')
        category_id = request.POST.get('category_id')
        tags = request.POST.get('tags')

        if not bvid or not title or not author_mid or not pub_time or not duration or not category_id:
            return render(request, 'add.html', {'error': '添加视频信息失败，请填写所有必填字段'})

        try:
            Video.objects.create(
                bvid=bvid,
                title=title,
                author_mid=author_mid,
                pub_time=pub_time,
                duration=duration,
                category_id=category_id,
                tags=tags
            )
            return redirect('video_management:home')
        except Exception as e:
            return render(request, 'add.html', {'error': f'添加视频信息失败，请重试: {str(e)}'})
    return render(request, 'add.html')

def logout_view(request):
    logout(request)
    return redirect('video_management:user_login')

