class MosaicoNatura::DeviseMailer < Devise::Mailer
  prepend_view_path Rails.root.join('app', 'views', 'mosaico_natura')
end