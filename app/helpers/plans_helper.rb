module PlansHelper
  
  
  def name_text_field f
    (f.label :name)  + 
    (f.text_field :name, :class => "text-area required", :title => "Please enter name", :tabindex => 1) 
  end 
  
end
