module HandlebarWax
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

