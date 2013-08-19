class MySurveysController < SmApplicationController
  # force_ssl

  # GET /my_surveys
  # GET /my_surveys.json
  def index
    @my_surveys = nil # MySurvey.all

    @basic_user = params.key?(:basic_user)
    @embedded_ssl = ! params.key?(:non_ssl)
    @embedded_relative = params.key?(:relative)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_surveys }
    end
  end

  # GET /my_surveys/1
  # GET /my_surveys/1.json
  def show
    @my_survey = nil # MySurvey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_survey }
    end
  end

  # GET /my_surveys/new
  # GET /my_surveys/new.json
  def new
    @my_survey = nil # MySurvey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_survey }
    end
  end

  # GET /my_surveys/1/edit
  def edit
    @my_survey = nil # MySurvey.find(params[:id])
  end

  # POST /my_surveys
  # POST /my_surveys.json
  def create
    @my_survey = nil # MySurvey.new(params[:my_survey])

    respond_to do |format|
      if @my_survey.save
        format.html { redirect_to @my_survey, notice: 'My survey was successfully created.' }
        format.json { render json: @my_survey, status: :created, location: @my_survey }
      else
        format.html { render action: "new" }
        format.json { render json: @my_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_surveys/1
  # PUT /my_surveys/1.json
  def update
    @my_survey = nil # MySurvey.find(params[:id])

    respond_to do |format|
      if @my_survey.update_attributes(params[:my_survey])
        format.html { redirect_to @my_survey, notice: 'My survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @my_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_surveys/1
  # DELETE /my_surveys/1.json
  def destroy
    @my_survey = nil # MySurvey.find(params[:id])
    @my_survey.destroy

    respond_to do |format|
      format.html { redirect_to my_surveys_url }
      format.json { head :no_content }
    end
  end
end
