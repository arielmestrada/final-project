module UsersHelper
    def complete_name(user)
        return if user.nil?
        "#{user.first_name} #{user.last_name}"
    end

    def same_pref_user_ids(dog_name)
        @user_ids = Array.new
        User.all.each do |user|
            if user.user_preferences.include?(dog_name)
                @user_ids << user.id
            end
        end
        return @user_ids
    end
end
