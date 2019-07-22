require_relative './department'

class Application
  attr_accessor :departments
  @department_names

  def initialize #constructor
    @department_names = ['EEE', 'MECH', 'CSE', 'CIVIL']
    self.departments = @department_names.map { |dept| Department.new dept}
  end

  def enroll(student_name, student_department)
    
    @index=@department_names.index(student_department)
     
    if(@index != nil)
      return departments[@index].enroll student_name 
    else
      return "Error: No such department exists\n\n"
    end

  end

  def change_dept(student_name, student_department)
    
    @index=@department_names.index(student_department)
     
    if(@index != nil)

        
        if(@departments[@index].total_students<30)
         @retstring=""
         @departments.each do |dept|
          @retstring=dept.remove student_name
          break if @retstring!="Not found"
         end

         if(@retstring=="Not found")
          return "Error: No such student is found\n\n"
         end

        
    else
      return "Error: No such department exists\n\n"
    end
    
  end

  def change_section(student_name, section)
    
    @retstring=""
    @departments.each do |dept|
      @retstring = dept.change_section student_name, section
      if(@retstring!="Not found")
        return @retstring+"\n"
      end
    end
    return "Error: No such student is found\n\n"
    
  end

  def department_view(student_dept)
    
    @index=@department_names.index(student_dept)
     
    if(@index != nil)
      return departments[@index].department_view 
    else
      return "Error: No such department exists\n\n"
    end
    
  end

  def section_view(student_dept, section)
   
    @index=@department_names.index(student_dept)
     
    if(@index != nil)
      return departments[@index].section_view section 
    else
      return "Error: No such department exists\n\n"
    end

  end

  def student_details(student_name)
    
    @departments.each do |dept|
      @retstring = dept.student_details student_name
      if(@retstring!="Not found")
        return student_name + " - " + @retstring
      end
    end
    return "Error: No such student is found\n"

  end
end