from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import gettext_lazy as _


class VideoBasic(models.Model):
    bvid = models.CharField(max_length=12, primary_key=True, verbose_name='视频唯一标识')
    title = models.CharField(max_length=200, verbose_name='视频标题')
    author_mid = models.CharField(max_length=20, verbose_name='UP主MID')
    pub_time = models.DateTimeField(verbose_name='发布时间')
    duration = models.PositiveIntegerField(verbose_name='视频时长(秒)')
    play_count = models.IntegerField(verbose_name='播放量')

    class Meta:
        verbose_name = '视频基本信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.bvid


class User(AbstractUser):
    id = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(blank=True, null=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=2, blank=True, null=True)
    birthdate = models.DateField(blank=True, null=True)
    registration_ip = models.CharField(max_length=45)
    last_login = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_locked = models.BooleanField(default=False)
    failed_attempts = models.SmallIntegerField(default=0)
    is_superuser = models.BooleanField(default=False)
    first_name = models.CharField(_('first name'), max_length=150, blank=True, null=True)
    last_name = models.CharField(_('last name'), max_length=150, blank=True, null=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    phone = models.CharField(max_length=20, blank=True, null=True)
    country = models.CharField(max_length=2, blank=True, null=True)
    birthdate = models.DateField(blank=True, null=True)

    def create_superuser(self, username, email=None, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(username, email, password, **extra_fields)

    class Meta:
        db_table = 'user'
        indexes = [
            models.Index(fields=['username'], name='idx_username'),
            models.Index(fields=['created_at'], name='idx_created'),
        ]

    def _create_user(self, username, email, password, param):
        pass