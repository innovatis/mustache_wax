module HandlebarWax
  class JavascriptCompiler
    def self.generate_templates
      templates = {}
      HandlebarWax.template_files.each do |template_file|
        name = template_file.scan(/app\/views\/(.*)\.[^\.]+\.hbs$/).flatten.first
        templates[name] = File.read(template_file)
      end
   
      script = File.read(File.join(File.dirname(__FILE__), 'templates', 'handlebars_templates.js.hbs'))
      script.sub!("{{templates}}", Yajl::Encoder.encode(templates)) # How ironic is this?
   
      File.open(HandlebarWax.output_path, 'w') { |f| f.puts script }
    end
  end 
end 


