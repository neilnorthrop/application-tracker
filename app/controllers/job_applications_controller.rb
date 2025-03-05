class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  def index
    @job_applications = current_user.job_applications
  end

  def show
  end

  def new
    @job_application = current_user.job_applications.build
  end

  def edit
  end

  def create
    @job_application = current_user.job_applications.build(job_application_params)
    if @job_application.save
      redirect_to @job_application, notice: 'Job application was successfully created.'
    else
      render :new
    end
  end

  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application, notice: 'Job application was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @job_application.destroy
    redirect_to job_applications_url, notice: 'Job application was successfully destroyed.'
  end

  private

  def set_job_application
    @job_application = current_user.job_applications.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:company_name, :position, :application_date, :status, :resume, :cover_letter)
  end
end
