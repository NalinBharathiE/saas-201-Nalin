require_relative './department'

class Application
  attr_accessor :dept
  @dept_name

  def initialize
  	@dept_name = ['EEE', 'MECH', 'CSE', 'CIVIL']
    self.dept = @dept_name.map { |dept| Department.new dept}
  end

  def enroll(student_name, student_department)
    
        @index=@dept_name.index(student_department)
     
    if(@index != nil)
    	return dept[@index].enroll student_name 
    else
    	return "Error: No such department exists\n\n"
    end
   
  end

  def change_dept(student_name, student_department)
  	    
  end
  
  def change_section(student_name, section)
    
  end        
  
  def department_view(student_dept)
    
    @index=@dept_name.index(student_dept)
     
    if(@index != nil)
    	return dept[@index].department_view 
    else
    	return "Error: No such department exists\n\n"
    end
    
  end

  def section_view(student_dept, section)
        
    @index=@dept_name.index(student_dept)
     
    if(@index != nil)
    	return dept[@index].section_view section 
    else
    	return "Error: No such department exists\n\n"
    end
       
  end

  def student_details(student_name)
     
    
    @dept.each do |dept|
    	@retstring = dept.student_details student_name
    	if(@retstring!="Not found")
    		return student_name + " - " + @retstring
    	end
    end
    return "Error: No such student is found\n"
    
  end
end