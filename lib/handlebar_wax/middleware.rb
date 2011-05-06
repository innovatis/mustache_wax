module HandlebarWax
  class Middleware
    def initialize(app)
      @app=app
      @newest = Time.now
    end 
    
    def call(env)
      mtimes = HandlebarWax.template_files.map do |f|
        File.mtime(f)
      end 
      
      if mtimes.any? && (newest = mtimes.max) > @newest
        HandlebarWax.generate_templates
      end 
      
      @app.call(env)
    end 
  end 
end 
