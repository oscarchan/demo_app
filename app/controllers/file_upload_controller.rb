class FileUploadController < ApplicationController
  # before_action :set_jquery_form, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => :create


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

    hack = true;

    if hack
      result = {
          status: 0,
          data: {
              duplicates: [],
              invalids: [],
              counts: {
                  total_input_contacts: 1,
                  bounced: 0,
                  added_to_list: {},
                  input_duplicate: 0,
                  past_max: 0,
                  invalid: 0,
                  duplicate: 0,
                  inactive: 0,
                  optedout: 0,
                  max: 2000000,
                  added_to_book: 1,
                  import_attempt: 1
              },
              import_session_id: 32209,
              input_duplicates: []
          }
      }
      @file_upload_form = FileUploadForm.new
      @file_upload_form.file_content = result

      session[:last_file_upload_result] = result

      if request.headers['X-Requested-With'] == 'XMLHttpRequest'
        render json: result
      else
        render action: 'create_barebone', layout: 'application_barebone'
        # render action: 'create'
      end
    else
      @file_upload_form = FileUploadForm.new(params[:file_upload])
      @file_upload_form.submit(params)

      result = { content: @file_upload_form.file_content }

      session[:last_file_upload_result] = result

      if request.headers['X-Requested-With'] == 'XMLHttpRequest'
        render json: result
      else
        render action: 'create'
      end

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
