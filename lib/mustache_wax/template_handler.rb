require 'active_support'

module MustacheWax
  class TemplateHandler
    def self.call(template)
      Mustache.render(template.source, assigns.merge(local_assigns))
    end 
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(:mustache, ::MustacheWax::TemplateHandler)
end
