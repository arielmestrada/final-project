module ApplicationHelper
  def count_user_login
    current_user.login_count += 1
    current_user.save
    current_user.login_count
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info alert-dismissible fade show m-0'
    when 'success' then 'alert alert-success alert-dismissible fade show m-0'
    when 'error' then 'alert alert-danger alert-dismissible fade show m-0'
    when 'alert' then 'alert alert-warning alert-dismissible fade show m-0'
    end
  end

  def font_awesome(level)
    case level
    when 'notice' then 'fa-solid fa-triangle-exclamation'
    when 'success' then 'fa-solid fa-check'
    when 'error' then 'fa-solid fa-xmark'
    when 'alert' then 'fa-solid fa-bell'
    end
  end

  def pending_request
    current_user.friends.where(is_friends: false, is_approver: true)
  end

  def pending_friends
    Friend.where(user_id: current_user.id, is_approver: true, is_friends: false).pluck(:friend_id).map do |id|
      User.find(id)
    end
  end

  def waiting_request
    Friend.where(friend_id: current_user.id, is_approver: true, is_friends: false).pluck(:user_id).map do |id|
      User.find(id)
    end
  end
end
