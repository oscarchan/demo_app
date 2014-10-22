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

    @file_upload_form.submit(params)

    respond_to do |format|
      format.html {
        if request.headers['X-Requested-With'] == 'XMLHttpRequest'
          # render json: { content: 'abc' }
          redirect_to file_upload_path
        else
          data = '{"status": 0, "data": {"duplicates": [], "invalids": [], "counts": {"total_input_contacts": 3, "max": 2000000, "added_to_list": {}, "input_duplicate": 0, "invalid": 0, "duplicate": 3, "inactive": 0, "past_max": 0, "added_to_book": 0, "import_attempt": 3}, "import_session_id": 72859, "input_duplicates": []}}'
          render inline: "<textarea>#{data}</textarea>", content_type: 'text/html'
        end
        # render action: 'show'
      }
      format.json {
        if request.headers['X-Requested-With'] == 'XMLHttpRequest'
          render json: { content: @file_upload_form.file_content }

        else
          render inline: "<textarea>{\"content\": \"#{@file_upload_form.file_content}\"}</textarea>", content_type: 'text/html'
        end
      }
    end
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
