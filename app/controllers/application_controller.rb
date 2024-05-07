class ApplicationController < ActionController::Base
  before_action :load_resource, only: %i[ show edit update destroy ]

  def index
    instance_variable_set("@#{resource_name.to_s.pluralize}", service.send("load_#{resource_name.to_s.pluralize}"))
  end

  def show
  end

  def new
    instance_variable_set("@#{resource_name}", resource_klass.new)
  end

  def create
    success = lambda do |resource|
      respond_to do |format|
        format.html { redirect_to @resource, notice: "#{resource_name.to_s.titleize} was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      end
    end

    failure = lambda do |resource|
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

    service.send("create_#{resource_name}", permitted_params, success, failure) do |resource|
      instance_variable_set("@#{resource_name}", resource)
    end
  end

  def edit
  end

  def update
    success = lambda do |resource|
      respond_to do |format|
        format.html { redirect_to post_url(@resource), notice: "#{resource_name.to_s.titleize}  was successfully updated." }
        format.json { render :show, status: :ok, location: @resource }
      end
    end

    failure = lambda do |resource|
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

    service.send("update_#{resource_name}", @resource, permitted_params, success, failure)
  end

  def destroy
    @resource.destroy!

    respond_to do |format|
      format.html { redirect_to resource_klass, notice: "#{resource_name.to_s.titleize} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def load_resource
    @resource = service.send("load_#{resource_name}", params[:id])
    instance_variable_set("@#{resource_name}", @resource)
  end

  def resource_name; params[:controller].singularize ; end
  def resource_klass; resource_name.classify.constantize; end
end
