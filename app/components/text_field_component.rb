# frozen_string_literal: true

class TextFieldComponent < ViewComponent::Base
  def initialize(html_attributes)
    super
    @input_attributes = html_attributes.fetch(:input)
    @label_attributes = html_attributes.fetch(:label)
  end
end
