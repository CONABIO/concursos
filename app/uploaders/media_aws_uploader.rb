class MediaAwsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :aws

  def download_url(filename)
    url(response_content_disposition: %Q{attachment; filename="#{filename}"})
  end

  def store_dir
    concurso = model.class.to_s.underscore.split("_").last
    "media/#{concurso}/#{model.usuario.id}"
  end

  def extension_allowlist
    %w(jpg jpeg png mp4)
  end

  version :galeria, if: :es_imagen? do
    process resize_to_limit: [1200, 1200]
    process convert: "jpg"
  end

  def es_imagen?(file)
    %w(image/jpeg image/png).include?(file.content_type)
  end
end