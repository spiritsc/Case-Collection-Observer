class CaseObserverGenerator < Rails::Generator::NamedBase
  attr_accessor :observer
  attr_accessor :models
  
  def initialize(runtime_args, runtime_options = {})
    super
    @observer = class_name
    @models = @args
  end
  
  def manifest
    record do |m|
      # Check existing folders
      m.directory "app/models"
      m.directory "test/unit"
      
      # Copy observer
      m.template "case_collection_observer.rb", "app/models/#{observer_singular}_observer.rb"
      
      # Copy observer tests
      unless options[:skip_test]
        m.template "case_collection_observer_test.rb", "test/unit/#{observer_singular}_observer_test.rb"
      end
    end
  end
  
  def observer_singular
    observer.underscore
  end
  
  def observer_singular_class
    observer_singular.camelize
  end
  
  def models_singular
    models.collect { |m| m.underscore }
  end
  
  def models_singular_sym
    models_singular.collect { |m| ":#{m.to_sym}" }
  end
  
  protected
    def banner
      "\nCase Collection Observer usage:\n" + 
      "========================================================" +
      "\n#{$0} case_observer OBSERVER_NAME MODELS_TO_OBSERVE [options]\n"
    end
    
    def add_options!(opt)
      opt.separator ''
      opt.separator 'Case Collection Observer options:'
      opt.separator '========================================================'
      opt.on("--skip-test", "Skip all tests for observer") { |value| options[:skip_test] = value }    
    end
    
    def usage_message
      ''
    end
end