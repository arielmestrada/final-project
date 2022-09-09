# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    user ||= User.new
    if user.admin?
      can :manage, :all
      can :manage, UsersController
    elsif user.banned?
      cannot :manage, PagesController
      cannot :manage, BreedsController
      cannot :manage, ChannelsController
      cannot :manage, CommentsController
      cannot :manage, FriendsController
      cannot :manage, MessagesController
      cannot :manage, PostsController
      cannot :manage, PreferencesController
      cannot :manage, UsersController
    else
      cannot :manage, UsersController
      can :manage, PagesController
      can :manage, BreedsController
      can :manage, ChannelsController
      can :manage, CommentsController
      can :manage, FriendsController
      can :manage, MessagesController
      can :manage, PostsController
      can :manage, PreferencesController
    end
    # can :manage, Pages if user.banned?
    # can :manage, User if user.admin?
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all ser
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
