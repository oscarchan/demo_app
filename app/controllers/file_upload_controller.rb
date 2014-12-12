class FileUploadController < ApplicationController
  # before_action :set_jquery_form, only: [:show, :edit, :update, :destroy]


  # GET /file_upload/1
  def show
  end

  # GET /file_upload/new
  def new
    @file_upload_form = FileUploadForm.new
  end

  # GET /file_upload/1/edit
  def edit
  end

  # POST /file_upload
  def create
    @file_upload_form = FileUploadForm.new(params[:file_upload])
    form_auth_token = params[:authenticity_token]
    @file_upload_form.submit(params)


    result = { content: @file_upload_form.file_content }
    session[:last_file_upload_result] = result
    if request.headers['X-Requested-With'] == 'XMLHttpRequest'
        render json: result
    else
      render action: 'create'
    end
  end

  def result
    logger.info "session = #{session[:last_file_upload_result]}"
    render json: session[:last_file_upload_result]

  end

  # PATCH/PUT /file_upload/1
  def update
    if @jquery_form.update(jquery_form_params)
      redirect_to @jquery_form, notice: 'Jquery form was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /file_upload/1
  def destroy
    @jquery_form.destroy
    redirect_to jquery_forms_url, notice: 'Jquery form was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jquery_form
      @jquery_form = JqueryForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def jquery_form_params
      params[:jquery_form]
    end
end
