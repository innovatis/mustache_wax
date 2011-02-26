require 'handlebar_wax/template_handler'
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
  
  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer 'handlebar_wax.initialize' do |app|
        HandlebarWax.generate_templates
        HandlebarWax.register_expansion
        if Rails.env.development?
          app.config.middleware.use HandlebarWax::Middleware
        end 
      end 
    end
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
      name = template_file.gsub(/^.*app\/views\//, '').gsub(/\.[^\.]+\.hbs$/, '') # todo: refactor to a String#scan
      content = File.read(template_file)
      templates[name] = content
    end

    script = "window.HandlebarsTemplates = #{Yajl::Encoder.encode(templates)};"

    File.open(output_path, 'w') { |f| f.puts script }
  end
end
