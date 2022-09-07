module UsersHelper
    def complete_name(user)
        return if user.nil?
        "#{user.first_name} #{user.last_name}"
    end
end
