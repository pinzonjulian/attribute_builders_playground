class MaterialFormBuilder < ApplicationFormBuilder
  text_fields = %i(
    text_field
    email_field
    number_field
    password_field
    search_field
    tel_field
    url_field
 )
  # e.g. Text Field
  # def text_field(method, options = {})
  #   build_text_field(method, options, __method__)
  # end
  text_fields.each do |name|
    define_method name do |method, options = {}|
      build_text_field(method, options, __method__)
    end
  end

  def switch(method, options = {}, checked_value = "on", unchecked_value = "off")
    # https://github.com/material-components/material-web/blob/main/docs/components/switch.md
    attribute_builder = ActionView::Helpers::AttributeBuilders::CheckBox.new(object_name, method, @template, checked_value, options)
    html_attributes = attribute_builder.html_attributes

    # switches behave like checkboxes BUT use selected instead of checked
    html_attributes.merge!("selected" => "true") if html_attributes.delete("checked")

    @template.capture do
      # copied from Rails' check_box tag.
      # Can't use hidden_field because it includes more stuff we don't need.
      hidden_options = html_attributes.slice("name", "disabled", "form").merge!("type" => "hidden", "value" => unchecked_value, "autocomplete" => "off")
      @template.concat @template.tag(:input, hidden_options)
      @template.concat @template.content_tag("md-switch", nil, html_attributes)
    end
  end

  def check_box(method, options = {}, checked_value = "on", unchecked_value = "off")
    attribute_builder = checkbox_attribute_builder(method, options, checked_value)
    html_attributes = attribute_builder.html_attributes
    @template.capture do
      # copied from Rails' check_box tag.
      # Can't use hidden_field because it includes more stuff we don't need.
      hidden_options = html_attributes.slice("name", "disabled", "form").merge!("type" => "hidden", "value" => unchecked_value, "autocomplete" => "off")
      @template.concat @template.tag(:input, hidden_options)
      @template.concat @template.content_tag("md-checkbox", nil, html_attributes)
    end
  end

  def slider(method, options = {})
    attribute_builder = range_field_attribute_builder(method, objectify_options(options))
    html_attributes = attribute_builder.html_attributes

    @template.content_tag("md-slider", nil, html_attributes)
  end

  def radio_button(method, tag_value, options = {})
    attribute_builder = radio_button_attribute_builder(method, tag_value, options)
    html_attributes = attribute_builder.html_attributes

    @template.content_tag("md-radio", nil, html_attributes)
  end

  def button(value = nil, options = {}, &block)
    attribute_builder = button_attribute_builder(value, options)

    @template.content_tag("md-filled-button", attribute_builder.value, attribute_builder.html_attributes)
  end

  private

  def build_text_field(method, options, method_name)
    # e.g. text_field_form_builder(method, options)
    # These methods live in the proposed ActionView::AttributeBuilders gem
    # and are NOT currently part of Rails. This is the actual proposal!
    icon = options.delete(:icon)
    attribute_builder = public_send("#{method_name}_attribute_builder", method, options)
    html_attributes = attribute_builder.html_attributes
    html_attributes.merge!(**options, label: method)
    if object.errors.where(method).present?
      html_attributes.merge!(error: object.invalid?, "error-text" => object.errors.where(method).map(&:full_message))
    end

    @template.content_tag("md-outlined-text-field", html_attributes) do
      if icon.present?
        @template.content_tag(
          "md-icon",
          icon.fetch(:name),
          { slot: "#{icon.fetch(:position)}-icon" }
        )
      end
    end
  end
end