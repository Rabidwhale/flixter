class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson

  def new
    @lesson = Lesson.new
  end

  def create
  end

  private

  def require_authorized_for_current_lesson
    if current_lesson.section.course.user != current_user
      redirect_to course_path, alert: 'You Need to Enroll to View This Page'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
