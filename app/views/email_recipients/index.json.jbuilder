json.array!(@email_recipients) do |email_recipient|
  json.extract! email_recipient, :id, :email, :subject, :content, :order_id
  json.url email_recipient_url(email_recipient, format: :json)
end
