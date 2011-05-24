require 'active_support/json'

require 'mustache_wax/template_handler'
require 'mustache_wax/engine'

module MustacheWax
  
  def self.template_files
    Dir[File.join(%w(app views), '**', '*.mustache')]
  end 

  def self.output_path
    assets = File.join(File.dirname(__FILE__),'..','app','assets')
    "#{assets}/javascripts/mustaches_templates.js"
  end 
  
  def self.templates_for_javascript
    templates = {}
    template_files.each do |template_file|
      # TODO : Scan all view directories
      name = template_file.scan(/app\/views\/(.*)\.[^\.]+\.mustache$/).flatten.first
      templates[name] = File.read(template_file)
    end
 
    tpl = File.read(File.join(File.dirname(__FILE__), 'mustache_wax', 'templates', 'mustache_templates.js.mustache'))
    
    Mustache.render(tpl, {:templates => ActiveSupport::JSON.encode(templates)})
  end

end
 
