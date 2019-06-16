class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson

  def new
    @lesson = Lesson.new
  end

  def create
  end

  private

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end

  def require_authorized_for_current_lesson
    if current_lesson.section.course != current_user.enrolled_in?
      redirect_to course_path, alert: 'You Need to Enroll to View This Page'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
