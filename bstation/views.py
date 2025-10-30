from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.utils import timezone
from django.db import IntegrityError
from django.core.exceptions import ValidationError
from django.contrib.auth.hashers import make_password, check_password
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, user_passes_test
from django.core.paginator import Paginator
from .models import User, VideoBasic
import json
from datetime import datetime
from django.db.models import Q

@login_required
def user_detail(request, user_id):
    user = get_object_or_404(User, id=user_id)
    return JsonResponse({
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'phone': user.phone,
        'country': user.country,
        'birthdate': user.birthdate,
        'is_active': user.is_active,
        'is_superuser': user.is_superuser
    })

@login_required
@user_passes_test(lambda u: u.is_superuser)  # 确保只有管理员可以访问
def user_list(request):
    page = request.GET.get('page', 1)
    search = request.GET.get('search', '')
    per_page = 10

    users = User.objects.all().order_by('-created_at')

    if search:
        users = users.filter(
            Q(username__icontains=search) |
            Q(email__icontains=search) |
            Q(phone__icontains=search)
        )

    paginator = Paginator(users, per_page)
    page_obj = paginator.get_page(page)

    user_data = []
    for user in page_obj:
        user_data.append({
            'id': user.id,
            'username': user.username,
            'email': user.email,
            'phone': user.phone,
            'country': user.country,
            'birthdate': user.birthdate.strftime('%Y-%m-%d') if user.birthdate else None,
            'registration_ip': user.registration_ip,
            'last_login': user.last_login.strftime('%Y-%m-%d %H:%M:%S') if user.last_login else None,
            'created_at': user.created_at.strftime('%Y-%m-%d %H:%M:%S'),
            'updated_at': user.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
            'is_active': user.is_active,
            'is_locked': user.is_locked,
            'is_superuser': user.is_superuser
        })

    return JsonResponse({
        'users': user_data,
        'total_pages': paginator.num_pages,
        'current_page': page_obj.number
    })
@login_required
@user_passes_test(lambda u: u.is_superuser)
def update_user(request, user_id):
    user = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        email = request.POST.get('email')
        phone = request.POST.get('phone')
        country = request.POST.get('country')
        birthdate = request.POST.get('birthdate')
        is_active = request.POST.get('is_active')
        is_superuser = request.POST.get('is_superuser')

        user.username = username
        user.email = email
        user.phone = phone
        user.country = country
        if birthdate:
            user.birthdate = birthdate
        if password:
            user.set_password(password)
        user.is_active = True if is_active else False
        user.is_superuser = True if is_superuser else False
        user.save()

        # 保存后重定向到用户列表页面
        return redirect('user_list')
    return render(request, 'edit_user.html', {'user': user})

@login_required
def current_user(request):
    user = request.user
    return JsonResponse({
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'phone': user.phone,
        'country': user.country,
        'birthdate': user.birthdate.strftime('%Y-%m-%d') if user.birthdate else None,
        'registration_ip': user.registration_ip,
        'last_login': user.last_login.strftime('%Y-%m-%d %H:%M:%S') if user.last_login else None,
        'created_at': user.created_at.strftime('%Y-%m-%d %H:%M:%S'),
        'updated_at': user.updated_at.strftime('%Y-%m-%d %H:%M:%S'),
        'is_active': user.is_active,
        'is_locked': user.is_locked,
        'is_superuser': user.is_superuser
    })

@login_required
@user_passes_test(lambda u: u.is_superuser)
def create_user(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        required_fields = ['username', 'password', 'email']
        for field in required_fields:
            if field not in data:
                return JsonResponse({'error': f'缺少必填字段: {field}'}, status=400)

        try:
            user = User(
                username=data['username'],
                email=data['email'],
                phone=data.get('phone', ''),
                country=data.get('country', ''),
                birthdate=datetime.strptime(data.get('birthdate', ''), '%Y-%m-%d').date() if data.get('birthdate') else None,
                is_superuser=bool(int(data.get('is_superuser', 0))),
                is_active=bool(int(data.get('is_active', 1))),
                is_locked=bool(int(data.get('is_locked', 0))),
                registration_ip=request.META.get('REMOTE_ADDR', '')
            )

            user.set_password(data['password'])
            user.save()

            return JsonResponse({'message': '用户创建成功', 'user': {
                'id': user.id,
                'username': user.username
            }})
        except IntegrityError:
            return JsonResponse({'error': '用户名已存在'}, status=400)
        except ValidationError as e:
            return JsonResponse({'error': str(e)}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': '无效的请求方法'}, status=405)

@login_required
@user_passes_test(lambda u: u.is_superuser)
def delete_user(request, user_id):
    if request.method == 'DELETE':
        user = get_object_or_404(User, id=user_id)

        if user.id == request.user.id:
            return JsonResponse({'error': '不能删除自己'}, status=400)

        user.delete()
        return JsonResponse({'message': '用户删除成功'})

    return JsonResponse({'error': '无效的请求方法'}, status=405)

def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            return render(request, 'login.html', {'error': '用户名或密码错误'})

    return render(request, 'login.html')

def home(request):
    if request.user.is_authenticated:
        return render(request, 'layout.html', {'user': request.user})
    return redirect('user_login')

def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')
        phone = request.POST.get('phone')
        country = request.POST.get('country')
        birthdate = request.POST.get('birthdate')
        registration_ip = request.META.get('REMOTE_ADDR')
        is_superuser = request.POST.get('is_superuser') == '1'

        try:
            user_params = {
                'username': username,
                'email': email,
                'password': password,
                'phone': phone,
                'country': country,
                'birthdate': birthdate,
                'registration_ip': registration_ip,
                'is_staff': is_superuser,
                'is_active': True
            }

            if is_superuser:
                user = User.objects.create_superuser(**user_params)
            else:
                user = User.objects.create_user(**user_params)
            user.save()
            login(request, user)
            return redirect('home')
        except IntegrityError as e:
            return render(request, 'register.html', {'error': '用户名已存在'})
        except ValidationError as e:
            return render(request, 'register.html', {'error': '输入数据无效'})
    return render(request, 'register.html')

def add(request):
    if not request.user.is_authenticated:
        return redirect('user_login')
    if request.method == 'POST':
        pass
    return render(request, 'add.html')

def admin_page(request):
    if request.user.is_authenticated and request.user.is_superuser:
        return render(request, 'admin_page.html', {'user': request.user})
    return redirect('admin_user_management')

@login_required
def admin_user_management(request):
    return render(request, 'admin_page.html')

def logout_view(request):
    logout(request)
    return redirect('user_login')

def add_video(request):
    if request.method == 'POST':
        bvid = request.POST.get('bvid')
        title = request.POST.get('title')
        author_mid = request.POST.get('author_mid')
        pub_time = request.POST.get('pub_time')
        duration = request.POST.get('duration')
        play_count = request.POST.get('play_count')

        pub_time_naive = datetime.datetime.strptime(pub_time, '%Y-%m-%d %H:%M:%S')

        pub_time_aware = timezone.make_aware(pub_time_naive)

        video = VideoBasic(
            bvid=bvid,
            title=title,
            author_mid=author_mid,
            pub_time=pub_time_aware,
            duration=duration,
            play_count=play_count
        )
        video.save()

        return JsonResponse({'status': 'success', 'message': '视频添加成功'})

    return JsonResponse({'status': 'error', 'message': '无效的请求方法'})


def edit_video(request):
    if request.method == 'POST':
        bvid = request.POST.get('bvid')
        title = request.POST.get('title')
        author_mid = request.POST.get('author_mid')
        pub_time = request.POST.get('pub_time')
        duration = request.POST.get('duration')
        play_count = request.POST.get('play_count')

        try:
            video = VideoBasic.objects.get(bvid=bvid)
            video.title = title
            video.author_mid = author_mid
            video.pub_time = pub_time
            video.duration = duration
            video.play_count = play_count
            video.save()
            return JsonResponse({'status': 'success', 'message': '视频更新成功'})
        except VideoBasic.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '视频不存在'})

    return JsonResponse({'status': 'error', 'message': '无效的请求方法'})


def delete_video(request):
    if request.method == 'POST':
        bvid = request.POST.get('bvid')
        try:
            video = VideoBasic.objects.get(bvid=bvid)
            video.delete()
            return JsonResponse({'status': 'success', 'message': '视频删除成功'})
        except VideoBasic.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '视频不存在'})

    return JsonResponse({'status': 'error', 'message': '无效的请求方法'})


def get_videos(request):
    videos = VideoBasic.objects.all()
    data = []
    for video in videos:
        data.append({
            'bvid': video.bvid,
            'title': video.title,
            'author_mid': video.author_mid,
            'pub_time': video.pub_time.strftime('%Y-%m-%d %H:%M:%S'),
            'duration': video.duration,
            'play_count': video.play_count
        })
    return JsonResponse({'data': data})


def init_test_data(request):
    if request.method == 'POST':
        test_data = [
            {
                'bvid': 'BV1xx411c7m9',
                'title': '【测试视频】夏日旅行VLOG',
                'author_mid': '1234567',
                'pub_time': '2024-03-10 09:30:00',
                'duration': 360,
                'play_count': 1500
            },
            {
                'bvid': 'BV1Hx411w7Xk',
                'title': '编程入门教程 - JavaScript基础',
                'author_mid': '7654321',
                'pub_time': '2024-03-12 14:20:00',
                'duration': 720,
                'play_count': 8900
            },
            {
                'bvid': 'BV1qy4y1x7Kp',
                'title': '美食制作：秘制红烧肉',
                'author_mid': '1122334',
                'pub_time': '2024-03-15 18:00:00',
                'duration': 600,
                'play_count': 4500
            }
        ]

        for item in test_data:
            video = VideoBasic(
                bvid=item['bvid'],
                title=item['title'],
                author_mid=item['author_mid'],
                pub_time=item['pub_time'],
                duration=item['duration'],
                play_count=item['play_count']
            )
            video.save()

        return JsonResponse({'status': 'success', 'message': '测试数据初始化成功'})

    return JsonResponse({'status': 'error', 'message': '无效的请求方法'})


@csrf_exempt
def add_video(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        bvid = data.get('bvid')
        title = data.get('title')
        author_mid = data.get('author_mid')
        pub_time = data.get('pub_time')
        duration = data.get('duration')
        play_count = data.get('play_count')

        if not all([bvid, title, author_mid, pub_time, duration, play_count]):
            return JsonResponse({'status': 'error', 'message': '缺少必填字段'})

        try:
            video = VideoBasic(
                bvid=bvid,
                title=title,
                author_mid=author_mid,
                pub_time=pub_time,
                duration=duration,
                play_count=play_count
            )
            video.save()
            return JsonResponse({'status': 'success', 'message': '视频添加成功'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})

@login_required
def edit_user(request, user_id):
    user = get_object_or_404(User, id=user_id)
    return render(request, 'edit_user.html', {'user': user})

@csrf_exempt
def edit_video(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        bvid = data.get('bvid')
        title = data.get('title')
        author_mid = data.get('author_mid')
        pub_time = data.get('pub_time')
        duration = data.get('duration')
        play_count = data.get('play_count')

        if not all([bvid, title, author_mid, pub_time, duration, play_count]):
            return JsonResponse({'status': 'error', 'message': '缺少必填字段'})

        try:
            video = VideoBasic.objects.get(bvid=bvid)
            video.title = title
            video.author_mid = author_mid
            video.pub_time = pub_time
            video.duration = duration
            video.play_count = play_count
            video.save()
            return JsonResponse({'status': 'success', 'message': '视频更新成功'})
        except VideoBasic.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '视频不存在'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})


@csrf_exempt
def delete_video(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        bvid = data.get('bvid')

        if not bvid:
            return JsonResponse({'status': 'error', 'message': '缺少 BV 号'})

        try:
            video = VideoBasic.objects.get(bvid=bvid)
            video.delete()
            return JsonResponse({'status': 'success', 'message': '视频删除成功'})
        except VideoBasic.DoesNotExist:
            return JsonResponse({'status': 'error', 'message': '视频不存在'})
        except Exception as e:
            return JsonResponse({'status': 'error', 'message': str(e)})


def get_videos(request):
    videos = VideoBasic.objects.all()
    data = []
    for video in videos:
        data.append({
            'bvid': video.bvid,
            'title': video.title,
            'author_mid': video.author_mid,
            'pub_time': video.pub_time.strftime('%Y-%m-%d %H:%M:%S'),
            'duration': video.duration,
            'play_count': video.play_count
        })
    return JsonResponse({'data': data})