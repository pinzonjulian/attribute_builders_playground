
class ShoelaceFormBuilder < ApplicationFormBuilder

  text_fields = %i( text_field number_field color_field email_field search_field tel_field password_field url_field )
  # e.g. Text Field
  # def text_field(method, options = {})
  #   build_text_field(method, options, __method__)
  # end
  text_fields.each do |name|
    define_method name do |method, options = {}|
      build_text_field(method, options, __method__)
    end
  end

  def switch(method, options = { }, checked_value = nil, unchecked_value = nil)
    attribute_builder = checkbox_attribute_builder(method, options, checked_value)
    html_attributes = attribute_builder.html_attributes

    @template.content_tag("sl-switch", nil, html_attributes)
  end

  def check_box(method, options = { }, checked_value = nil, unchecked_value = nil)
    attribute_builder = checkbox_attribute_builder(method, options, checked_value)
    html_attributes = attribute_builder.html_attributes

    @template.content_tag("sl-checkbox", nil, html_attributes)
  end

  # incomplete
  def button(value = nil, options = {}, &block)
    @template.content_tag("sl-button", value, options.merge!(variant: :primary, type: :submit))
  end

  private

  def build_text_field(method, options, method_name)
    # e.g. text_field_form_builder(method, options)
    # These methods live in the proposed ActionView::AttributeBuilders gem
    # and are NOT currently part of Rails. This is the actual proposal!
    attribute_builder = public_send("#{method_name}_attribute_builder", method, options)
    html_attributes = attribute_builder.html_attributes
    html_attributes.merge!(**options, label: method)
    if object.errors.where(method).present?
      html_attributes.merge!("class": "field-with-error", "help-text" => object.errors.where(method).map(&:full_message))
    end

    @template.content_tag("sl-input", nil, html_attributes) do
      if options[:icon].present?
        @template.content_tag(
          "sl-icon",
          nil,
          {
            library: "material",
            name: options.dig(:icon, :name),
            slot: options.dig(:icon, :position)
          }
        )
      end
    end
  end
end
