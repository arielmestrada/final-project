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
end
