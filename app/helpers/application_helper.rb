module ApplicationHelper
  def json_for(target, options = {})
    options[:scope] ||= self
    options[:url_options] ||= url_options
    serializer = options.has_key?(:serializer) ? options.delete(:serializer) : target.active_model_serializer
    serializer.new(target, options).to_json
  end
end
