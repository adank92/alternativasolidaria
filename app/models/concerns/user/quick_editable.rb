module User::QuickEditable
  def send_quick_edit_email
    update(quick_edit_token: SecureRandom.alphanumeric(30))
    UserMailer.with(user: self, token: quick_edit_token).quick_edit_email.deliver_now
  end

  def clear_quick_edit_token
    update(quick_edit_token: nil)
  end
end
