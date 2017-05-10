class Student

  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses
  end

  def enroll(new_course)
    @courses.each do |course|
      if course.conflicts_with?(new_course)
        raise "#{course} conflicts with #{new_course}"
      end
    end
    @courses << new_course unless courses.include?(new_course)
    @courses.each do |course|
      if course == new_course && !course.students.include?(self)
        course.students << self
      end
    end
  end

  def course_load
    course_load_hash = Hash.new(0)
    @courses.each do |course|
      course_load_hash[course.department] += course.credits
    end
    course_load_hash
  end

end
