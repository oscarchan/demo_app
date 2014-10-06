class FileUploadForm
  include ActiveModel::Model

  attr_accessor :file

  attr_accessor :ajax_form, :ajax_submit

  def self.model_name
    ActiveModel::Name.new(self, nil, "FileUploadForm")
  end

  def file_content
    @file_content || []
  end

  def submit(params)
    file = params[:file_upload_form][:file]

    if file.respond_to?(:read)
      @file_content = file.read #.force_encoding('ISO-8859-1')
    end

    Rails.logger.info("params: #{@file_content}")
  end

end