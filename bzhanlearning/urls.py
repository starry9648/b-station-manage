from django.urls import path
from bstation import views

urlpatterns = [
    path('', views.user_login, name='user_login'),
    path('home/', views.home, name='home'),
    path('register/', views.register, name='register'),
    path('add/', views.add, name='add'),
    path('logout/', views.logout_view, name='logout'),
    path('admin/', views.admin_page, name='admin_page'),
    path('add_video/', views.add_video, name='add_video'),
    path('edit_video/', views.edit_video, name='edit_video'),
    path('delete_video/', views.delete_video, name='delete_video'),
    path('get_videos/', views.get_videos, name='get_videos'),
    path('init_test_data/', views.init_test_data, name='init_test_data'),
    path('api/users/', views.user_list, name='user_list'),
    path('api/users/current', views.current_user, name='current_user'),
    path('api/users/create', views.create_user, name='create_user'),
    path('api/users/delete/<int:user_id>', views.delete_user, name='delete_user'),
    path('user_list/', views.user_list),
    path('user/create/', views.create_user),
    path('user/delete/<int:user_id>/', views.delete_user, name='delete_user'),  # 添加name参数保持一致性
    path('user_detail/<int:user_id>/', views.user_detail, name='user_detail'),  # 添加name参数
    path('admin/users/edit/<int:user_id>/', views.edit_user, name='edit_user'),
    path('admin/users/update/<int:user_id>/', views.update_user, name='update_user'),
    path('accounts/login/', views.home, name='login'),

    # 管理员用户管理界面
    path('admin/users', views.admin_user_management, name='admin_user_management'),
]
