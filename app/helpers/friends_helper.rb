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

  def add_friend_request(user)
    receiver = User.find(user.id)
    receiver = receiver.friends.new
    receiver.is_approver = true
    receiver.is_friends = false
    receiver.user_id = user.id
    receiver.friend_id = current_user.id

    requester = current_user.friends.new
    requester.is_approver = false
    requester.is_friends = false
    requester.user_id = current_user.id
    requester.friend_id = user.id
    # user.friends.create(
    #   is_approver: true,
    #   is_friends: false,
    #   user_id: user.id,
    #   friend_id: current_user.id
    # )

    # current_user.friends.create(
    #   is_approver: false,
    #   is_friends: false,
    #   user_id: current_user.id,
    #   friend_id: user.id
    # )

    if current_user.friends.find_by(friend_id: @profile.id).nil?
      receiver.save
      requester.save
    end

    pusher = Pusherapi::Client.call
    pusher.trigger('add_friend', 'add_friend_event', { message: 'add' })
  end

  def decline(user)
    current_user.friends.find_by(friend_id: user).destroy
    user_receiver = User.find(user)
    user_receiver.friends.find_by(user_id: user).destroy
    pusher = Pusherapi::Client.call
    pusher.trigger('decline_request', 'decline_event', { message: 'decline' })
  end

  def accept(user)
    friend = current_user.friends.find_by(friend_id: user)
    friend.is_friends = true
    friend.save

    user_receiver = User.find_by(id: user)
    receiver = user_receiver.friends.find_by(friend_id: current_user.id)
    receiver.is_friends = true
    receiver.save
    pusher = Pusherapi::Client.call
    pusher.trigger('accept_request', 'accept_event', { message: 'accept' })
  end

  def unfriend(user)
    current_user.friends.find_by(friend_id: user).destroy
    u = User.find(params[:id].to_i)
    u.friends.find_by(friend_id: current_user.id).destroy

    pusher = Pusherapi::Client.call
    pusher.trigger('unfriend_request', 'unfriend_event', { message: 'unfriended' })
  end

  def all_friends(user = current_user.id)
    uf = User.find(user)
    uf.friends.where(is_friends: true).pluck(:friend_id).map do |id|
      User.find(id)
    end
  end

  def friend_ids
    current_user.friends.map do |friend| 
      friend.friend_id 
    end
  end

  def same_pref_friend_ids(dog_name)
    @friend_ids = Array.new
    current_user.friends.each do |friend|
      if Friend.user(friend).user_preferences.include?(dog_name)
          @friend_ids << friend.friend_id  
      end
    end
    return @friend_ids
  end
end
