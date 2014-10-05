class FileUploadForm
  include ActiveModel::Model

  attr_accessor :file

  def self.model_name
    ActiveModel::Name.new(self, nil, "FileUploadForm")
  end

  def file_content
    @file_content || []
  end

  def submit(params)
    file = params[:file_upload_form][:file]

    @file_content = file.read #.force_encoding('ISO-8859-1')

    Rails.logger.info("params: #{@file_content}")
  end

end