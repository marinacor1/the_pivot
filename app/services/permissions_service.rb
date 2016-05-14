class PermissionsService
  extend Forwardable

  def_delegators :user,
                 :patform_admin?,
                 :host?,
                 :registered_user?

  def initialize(user, controller, action) #pass user object or id? debatable
    @_user = user || User.new
    @_controller = controller
    @_action = action
  end

  def allow?
    case
    # when platform_admin? then platform_admin_permissions
    when host? then host_permissions
    when registered_user? then registered_user_permissions
    else
      unregistered_guest_permissions
    end
  end

  private

  def platform_admin_permissions
    return true if controller == "sessions"
    return true if controller == "items" && action.in?(%w( index show))
    return true if controller == "orders" && action.in?(%w( index show))
    return true if controller == "users" && action.in?(%w( index show edit update))
    return true if controller == "stores" && action.in?(%w( index show))
  end

  def host_permissions
    return true if controller == "sessions"
    return true if controller == "homes" && action.in?(%w( index show edit update))
    return true if controller == "welcome"
    return true if controller == "users" && action.in?(%w(new create edit update show))
    return true if controller == "cities" && action == "index"
    return true if controller == "cities" && action == "show"
    return true if controller == "sessions" && action == "new"
    return true if controller == "sessions" && action == "create"
    return true if controller == "sessions" && action == "destroy"
  end

  def registered_user_permissions
    return true if controller == "welcome"
    return true if controller == "sessions"
    return true if controller == "users" && action.in?(%w(new create show edit update))
    return true if controller == "cities" && action == "index"
    return true if controller == "cities" && action == "show"
    return true if controller == "homes" && action == "show"
    return true if controller == "homes" && action == "index"
    return true if controller == "sessions" && action == "new"
    return true if controller == "sessions" && action == "create"
    return true if controller == "sessions" && action == "destroy"
  end

  def unregistered_guest_permissions
    return true if controller == "welcome"
    return true if controller == "users" && action.in?(%w(new create))
    return true if controller == "cities" && action == "index"
    return true if controller == "cities" && action == "show"
    return true if controller == "homes" && action == "show"
    return true if controller == "homes" && action == "index"
    return true if controller == "sessions" && action == "new"
    return true if controller == "sessions" && action == "create"
    return true if controller == "sessions" && action == "destroy"
  end

  def controller
    @_controller
  end

  def action
    @_action
  end

  def user
    @_user
  end
end
