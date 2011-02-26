require 'handlebar_wax/template_handler'
require 'handlebar_wax/railtie'
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
  
  def self.generate_templates
    templates = {}
    template_files.each do |template_file|
      name = template_file.scan(/app\/views\/(.*)\.[^\.]+\.hbs$/).flatten.first
      templates[name] = File.read(template_file)
    end
 
    script = File.read(File.join(File.dirname(__FILE__), 'handlebar_wax', 'templates', 'handlebars_templates.js.hbs'))
    script.sub!("{{templates}}", Yajl::Encoder.encode(templates)) # How ironic is this?
 
    File.open(output_path, 'w') { |f| f.puts script }
  end

end
 
