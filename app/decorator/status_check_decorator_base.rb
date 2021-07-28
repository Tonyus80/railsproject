class StatusCheckBaseDecorator < SimpleDelegator
  def decorate(model_name, decorator_class = nil)
    ApplicationController.helpers.decorate(model_name, decorator_class)
  end
end

