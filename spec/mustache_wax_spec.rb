require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "HandlebarWax" do
  include FakeFS::SpecHelpers
  before(:each) do
    FileUtils.mkdir_p('app/views/something')
    File.open('app/views/something/example.html.hbs', 'w') do |f|
      f.write(%(<div>{{example}}</div>))
    end
  end
  
  it 'should generate a handlebars_templates.js from templates in app/views' do
    HandlebarWax.generate_templates
    File.read('public/javascripts/handlebars_templates.js').should == "window.HandlebarsTemplates = {\"something/example\":\"<div>{{example}}</div>\"};\n"
  end
  
end
