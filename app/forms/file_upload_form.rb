class FileUploadForm
  include ActiveModel::Model
  include ActiveModel::Callbacks

  module UploadType
    JQUERY_FILE_UPLOAD = :jquery_file_upload
    JQUERY_AJAX_FORM = :jquery_ajax_form
    JQUERY_AJAX_SUBMIT = :jquery_ajax_submit
    IFRAME = :iframe
  end

  attr_accessor :file, :upload_type

  def self.model_name
    ActiveModel::Name.new(self, nil, "FileUploadForm")
  end

  def initialize(attributes={})
    super
    @upload_type ||= UploadType::JQUERY_FILE_UPLOAD
    @file_content ||= []
  end


  def file_content
    @file_content
  end

  def submit(params)
    file = params[:file_upload_form][:file]

    if file.respond_to?(:read)
      @file_content = file.read #.force_encoding('ISO-8859-1')
    end

    Rails.logger.info("params: #{@file_content}")
  end
end