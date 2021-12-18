class MosaicoNatura::Devise::Mailer < ::Devise::Mailer
    default from: 'noreply@conabio.gob.mx'
    layout 'mosaico_natura'
end
