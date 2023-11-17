class ViewComponentFormBuilder < ApplicationFormBuilder

  def text_field(method, options = {})
    input_attribute_builder = text_field_attribute_builder(method, options)
    input_html_attributes = input_attribute_builder.html_attributes

    label_attribute_builder = label_attribute_builder(method, options, nil)
    label_html_attributes = label_attribute_builder.html_attributes

    html_attributes = {
      input: input_html_attributes,
      label: label_html_attributes
    }

    @template.render TextFieldComponent.new(html_attributes)
  end
end