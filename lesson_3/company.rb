module Company
  attr_accessor :company_name
  
  def set_company_name(name) 
    self.company_name = name
    puts "Компания \"#{self.company_name}\""
  end 
  
  def get_company_name 
    puts "Поезд №#{@number} принадлежит компании \"#{self.company_name}\""
  end
end