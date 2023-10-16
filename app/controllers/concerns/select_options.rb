module SelectOptions
  extend ActiveSupport::Concern

  def options(model_objects, option_name, option_value)
    model_objects.collect do |model_object|
      option_tag_text = model_object.send(option_name.to_sym)
      option_tag_value = model_object.send(option_value.to_sym)
      [option_tag_text, option_tag_value]
    end
  end
end
