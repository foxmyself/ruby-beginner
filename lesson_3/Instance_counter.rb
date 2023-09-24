module InstanceCounter
  
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.class_variable_set('@@count', 0)
  end
    
  module ClassMethods
    def instances
       self.class_variable_get('@@count') 
    end
  end  
  
  module InstanceMethods  
    protected

    def register_instance
      new_count = self.class.class_variable_get('@@count') + 1
      self.class.class_variable_set('@@count', new_count) 
    end
  end
end
 
