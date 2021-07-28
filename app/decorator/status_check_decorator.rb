class StatusCheckDecorator < StatusCheckBaseDecorator
  def show_status
    "Your admin status:#{admin}"
  end
end
