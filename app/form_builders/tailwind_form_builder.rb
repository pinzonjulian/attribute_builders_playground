class TailwindFormBuilder < ApplicationFormBuilder
  def text_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def number_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end


  def color_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def email_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def search_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def tel_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def password_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def url_field(method, options = {})
    super(method, options.merge!(class: "form-input"))
  end

  def check_box(method, options = { }, checked_value = nil, unchecked_value = nil)
    super(method, options.merge!(class: "form-checkbox"), checked_value = nil, unchecked_value = nil)
  end

  def button(value = nil, options = { }, &block)
    super(value, options.merge!(class: "bg-blue-100 blue-800"), &block)
  end
end