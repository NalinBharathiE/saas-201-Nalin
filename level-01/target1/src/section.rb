class Section

	attr_accessor :total_students
	attr_accessor :prefix_0
	@studentlist

	def initialize(prefix_0)
    self.total_students=0
    self.prefix_0=prefix_0
    @studentlist={}
  end

  def enroll(student_name)
  	@total_students+=1
  	names=@studentlist.keys 
  	names<<student_name 
  	names.sort! 
  	rno=1
  	@studentlist={} 
    names.each do |key|
  		if(rno<10)
  			@studentlist.merge!({key=>@prefix_0+"0"+rno.to_s}) 
  		else
  			@studentlist.merge!({key=>@prefix_0+rno.to_s})
  		end
  		rno+=1
  	end
  	return "Your roll number is #{@studentlist[student_name]}"		
  end

  def remove(student_name)
    
    if(@studentlist.keys.include? student_name)
      @studentlist.delete(student_name)

  end

  def sec_view
    @retstring = ""
    @studentlist.each do |key,value|
      @retstring = @retstring + "#{key} - #{value}" + "\n"
    end
    return @retstring
  end

  def student_details(student_name)
    @retstring=""
    if(@studentlist.keys.include? student_name)
      @retstring = "Section "+prefix_0[3] + " - #{@studentlist[student_name]}" 
      return @retstring
    else
      return "Not found"
    end 
  end

end