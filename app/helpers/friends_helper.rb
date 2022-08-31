module FriendsHelper
  def show_user(params)
    user_arr = params.split(/\s/)
    firstname = User.arel_table[:first_name]
    last_name = User.arel_table[:last_name]
    if user_arr[1].nil?
      User.where(firstname.matches("%#{user_arr[0]}%"))
    else
      User.where(firstname.matches("%#{user_arr[0]}%")).where(last_name.matches("%#{user_arr[user_arr.length - 1]}%"))
    end
  end

  def add_friend(user)
    user.friends.create(
      is_approver: true,
      is_friends: false,
      user_id: user.id,
      friend_id: current_user.id
    )
    current_user.friends.create(
      is_approver: false,
      is_friends: false,
      user_id: current_user.id,
      friend_id: user.id
    )
  end

  def decline(user)
    current_user.friends.find_by(friend_id: user).destroy
    user_receiver = User.find(user)
    user_receiver.friends.find_by(user_id: user).destroy
  end

  def accept(user)
    friend = current_user.friends.find_by(friend_id: user)
    friend.is_friends = true
    friend.save

    user_receiver = User.find_by(id: user)
    receiver = user_receiver.friends.find_by(user_id: user)
    receiver.is_friends = true
    receiver.save
  end

  def unfriend(user)
    current_user.friends.find_by(friend_id: user).destroy
    u = User.find(params[:id].to_i)
    u.friends.find_by(friend_id: current_user.id).destroy
  end
end
