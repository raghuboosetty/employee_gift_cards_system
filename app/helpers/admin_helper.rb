module AdminHelper
  def active_link_class(link_controller)
    controller_name == link_controller ? 'active' : ''
  end
end
