require 'active_support'
require 'pry'

module MustacheWax
  class TemplateHandler
    def call(template)
      binding.pry
      Mustache.render(template.source, assigns.merge(local_assigns))
    end
    # def render
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(:mustache, ::MustacheWax::TemplateHandler.new)
end
