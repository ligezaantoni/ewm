module Admin
  class ActivityFormDecorator < Draper::Decorator
    delegate_all
    
    def educational_method_name
      model.educational_method.name if model.educational_method.present?
    end

  end
end
