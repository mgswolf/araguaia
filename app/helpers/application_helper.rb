module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def t_field(model,field)
    t("activerecord.attributes.#{model}.#{field}")
  end

  def show_image(image)
    image_tag image unless image.blank? || image.nil?
  end
end
