module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
  
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat render partial: 'partials/alert', locals: { message: message, bootstrap_class: bootstrap_class_for(msg_type) }
    end
    flash.clear
    nil
  end

  # Returns all errors on an ActiveRecord object as a sentence.
  def errors_as_sentence(obj)
    obj.errors.full_messages.to_sentence
  end

end