class ContentController < ApplicationController
  before_filter :authenticate_user!
  
  def admin 
    authorize! :view, :admin, :message => 'Access limited to Administrators.'
  end
  
  def instructor
    authorize! :view, :instructor, :message => 'Access limited to Instructors.'
  end

  def student
    authorize! :view, :student, :message => 'Access limited to Students .'
  end
end
