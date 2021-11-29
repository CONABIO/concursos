class MediaAwsUploader < CarrierWave::Uploader::Base
  # Storage configuration within the uploader supercedes the global CarrierWave
  # config, so either comment out `storage :file`, or remove that line, otherwise
  # AWS will not be used.
  storage :aws

  # You can find a full list of custom headers in AWS SDK documentation on
  # AWS::S3::S3Object
  def download_url(filename)
    url(response_content_disposition: %Q{attachment; filename="#{filename}"})
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    concurso = model.class.to_s.underscore.split("_").last
    "media/#{concurso}/#{model.usuario.id}"
  end  

  def extension_allowlist
     %w(jpg jpeg png mp4)
  end  
end