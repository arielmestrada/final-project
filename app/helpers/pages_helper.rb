module PagesHelper
  def get_user_preferences(user)
    preferences = []
    user.user_preferences.each do |breed|
      preferences << Breed.find_by(name: breed)
    end
    preferences
  end
end
