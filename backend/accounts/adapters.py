from allauth.account.adapter import DefaultAccountAdapter

class CustomAccountAdapter(DefaultAccountAdapter):
    def save_user(self, request, user, form, commit=True):
        data = form.cleaned_data

        # 기본 저장 필드
        user = super().save_user(request, user, form, False)
        # 추가 저장 필드
        nickname = data.get('nickname')

        if nickname:
            user.nickname = nickname

        user.save()
        return user