require 'active_support'

module MustacheWax
  class TemplateHandler
    def call(template)
      "Mustache.render(#{template.source.inspect}, local_assigns).html_safe"
    end

    def render(template, local_assigns)
      Mustache.render(template.source, local_assigns)
    end 
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(:mustache, ::MustacheWax::TemplateHandler.new)
end
