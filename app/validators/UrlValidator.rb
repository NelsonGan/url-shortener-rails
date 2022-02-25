require 'public_suffix'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.present? && PublicSuffix.valid?(value)
      record.errors.add(attribute, "is not a valid HTTP URL")
    end
  end
end