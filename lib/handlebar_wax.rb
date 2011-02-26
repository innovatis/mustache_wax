require 'handlebar_wax/template_handler'
require 'handlebar_wax/railtie'
require 'handlebar_was/javascript_compiler'
require 'yajl'

module HandlebarWax
  
  autoload :Middleware, "handlebar_wax/middleware"
  
  def self.register_expansion(timestamp=nil)
    querystring = "?#{timestamp.to_i}" if timestamp
    expansions = { 
      :handlebar_wax => [
        "/javascripts/handlebars.js",
        "/javascripts/handlebars_templates.js#{querystring}"
      ]
    }
    ActionView::Helpers::AssetTagHelper.register_javascript_expansion(expansions)
  end
  
  def self.template_files
    Dir[File.join(%w(app views), '**', '*.hbs')]
  end 

  def self.output_path
    base = defined?(Rails.root) ? Rails.root : '.'
    "#{base}/public/javascripts/handlebars_templates.js"
  end 
  
end
