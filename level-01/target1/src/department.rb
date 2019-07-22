require_relative './section'

#Department Class
class Department

  attr_accessor :sections
  attr_accessor :total_students
  attr_reader :students
  @section_names
  @dept_name
  
  def initialize(dept_name)
    @section_names = ['A', 'B', 'C']
    @dept_name=dept_name
    self.sections = @section_names.map { |sec| Section.new dept_name[0,3]+sec}
    self.total_students=0
    @students=[]
  end

  def enroll(student_name)
    if(@total_students<30)
        @total_students+=1

        
        @index=0 
        loop do
          
          if(@sections[@index].total_students<10)
            @retstring=@sections[@index].enroll student_name
            @retstring="You have been enrolled to #{@dept_name}\nYou have been allotted section "+@section_names[@index]+"\n"+@retstring

            @students<<student_name
            return @retstring
          else
           @index+=1 
          end
        end

    else
        return "Error: There are no more seats in #{@dept_name}\n"
    end

  end

  def remove(student_name)
    if(@students.include? student_name)
      @students.delete(student_name)

      @sections.each do |section|
        section.remove student_name
      end

      @total_students-=1
    else
      return "Not found"
    end 
  end

  def department_view
    @retstring="List of students:\n"
    @sections.each do |sec|
      @retstring += sec.sec_view
    end
    return @retstring.chop
  end

  def section_view(section)

    
    @retstring="List of students:\n"
    @index=@section_names.index(section)
     
    if(@index != nil)
      @retstring += sections[@index].sec_view 
      return @retstring.chop
    else
      puts "Error: No such section exists\n"
    end

  end

  def student_details(student_name)

    @retstring=""
    if(@students.include? student_name)
      @sections.each do |section|
        @retstring = section.student_details student_name
        if(@retstring!="Not found")
          return @dept_name + " - " + @retstring
        end
      end   
    else
      return "Not found"
    end 
  end

  def change_section(student_name, section)
    
    if((@students.include? student_name)==false)
      return "Not found"
    end

    if(@section_names.include? section)
      @index=@section_names.index(section)
      if(@sections[@index].total_students<10) 
          
          @sections.each do |sec|   
            sec.remove student_name
          end

          @retstring=@sections[@index].enroll student_name
          @retstring="You have been allotted section "+section+"\n"+@retstring
          return @retstring    
      else 
         
      end
    else
      return "Error: No such section exists"
    end
  end

end