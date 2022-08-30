module ApplicationHelper
    def count_user_login
        current_user.login_count += 1
        current_user.save
        current_user.login_count
    end
end
