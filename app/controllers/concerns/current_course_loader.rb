module CurrentCourseLoader
  extend ActiveSupport::Concern
  included do 
    helper_method :current_course
  end

  def current_course
    @current_course ||= Course.find(params[:id])
  end
end