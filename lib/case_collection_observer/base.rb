module CaseCollectionObserver
  module Base
    def self.included(base)
      base.class_eval do
        include InstanceMethods
        extend ClassMethods
      end
    end
  
    module InstanceMethods
    end
  
    module ClassMethods
      def has_many_with_observer(association_id, options = {}, &extension)
        has_many association_id, case_observer_options(association_id, options), &extension
        case_observer_callbacks(association_id)
      end
      
      def has_and_belongs_to_many_with_observer(association_id, options = {}, &extension)
        has_and_belongs_to_many association_id, case_observer_options(association_id, options), &extension
        case_observer_callbacks(association_id)
      end
      
      private
        def case_observer_callbacks(association_id)
          ["before_save_#{association_id}", "after_save_#{association_id}", 
           "before_destroy_#{association_id}", "after_destroy_#{association_id}"].each do |method|
             define_method method do |record|
               puts "Jestem w:\nClass: #{self.class}\nObiekt-self: #{self}\nObiekt-metody: #{record}\n" + 
                  "Metoda: #{method}(#{self.class})"
               self.class.changed
               self.class.notify_observers(method, record)
             end
          end
        end
      
        def case_observer_options(association_id, options = {})
          callbacks = %w(before_add after_add before_remove after_remove)
          callbacks.each do |callback_name|
            new_callback = case callback_name.to_sym
            when :before_add
              "before_save_#{association_id}".to_sym
            when :after_add
              "after_save_#{association_id}".to_sym
            when :before_remove
              "before_destroy_#{association_id}".to_sym
            when :after_remove
              "after_destroy_#{association_id}".to_sym
            end
            if options[callback_name.to_sym]
              defined_callbacks = options[callback_name.to_sym]
              options[callback_name.to_sym] = [defined_callbacks, new_callback]
            else
              options[callback_name.to_sym] = new_callback
            end
          end
          return options
        end
    end
  end
end

if defined?(::ActiveRecord)
  module ::ActiveRecord
    class Base
      include CaseCollectionObserver::Base
    end
  end
end