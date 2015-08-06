class ApplicationPolicy
  attr_reader :user, :record
  
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    read?
  end

  def show?
    read?
  end

  def create?
    manage?
  end

  def new?
    create?
  end

  def update?
    manage?
  end

  def edit?
    update?
  end

  def destroy?
    manage?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  private
  
  def signed_in?
    user.present?
  end
  
#  def owner?
#  
#  end
  
  def read?
    signed_in?
  end
  
  def manage?
    read? && user.admin?
  end
end
