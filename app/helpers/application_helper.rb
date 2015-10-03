module ApplicationHelper

  BOOTSTRAP_CLASSES = ['default','primary','success','danger','info','warning']

  FLASH_LITERALS = {success: {bs_class: 'alert-success', icon: 'check-square-o'},
                    error: {bs_class: 'alert-danger', icon: 'times'},
                    alert: {bs_class: 'alert-warning', icon: 'exclamation-circle'},
                    notice: {bs_class: 'alert-info', icon: 'check'}}
  
  # Renders and displays the associated Twitter Bootstrap-compatible
  #   "alerts" in a colored `div` element with the appropriate `alert-*`
  #   class.
  def alerts
    check_devise_resource_for_errors
    msgs = flash.keys.collect do |msg_type|
      next unless FLASH_LITERALS.has_key? msg_type.to_sym
      render partial: 'partials/alert', locals: {
        icon: FLASH_LITERALS[msg_type.to_sym][:icon],
        message: flash.discard(msg_type).html_safe,
        bootstrap_class: FLASH_LITERALS[msg_type.to_sym][:bs_class]
      }
    end
    msgs.join.html_safe
  end

  # Given a collection of objects, assign one of the set of possible bootstrap
  #   *-default, *-primary, *-success, ..., *-danger classes as a String to each
  #   item in that collection. This is returned as a hash.
  # @param coll A collection.
  # @param class_type [String] The kind of classes (e.g., label, alert).
  def bootstrap_classes_for_collection coll, class_type='label'
    remaining = BOOTSTRAP_CLASSES.dup
    assignments = {}
    coll.each do |v|
      unless remaining.empty?
        assignments[v] = "#{class_type}-#{remaining.shift}"
      end
    end
    assignments
  end

  # Extends Devise with a method that checks the resource for errors.
  #   This is further used by the `alerts` method for consistent error presentation.
  def check_devise_resource_for_errors
    if (defined? resource) && resource && resource.errors.any?
      flash[:error] ||= resource.errors.full_messages.to_sentence << "."
    end
  end

  # Returns all errors on an ActiveRecord object as a sentence.
  def errors_as_sentence(obj)
    obj.errors.full_messages.to_sentence
  end

end