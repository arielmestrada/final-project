module PagesHelper
  def get_user_preferences(user)
    preferences = []
    user.user_preferences.each do |breed|
      preferences << Breed.find_by(name: breed)
    end
    preferences
  end

  def find_friend(user)
    current_user.friends.find_by(friend_id: user.id)
  end
end
