require "helix_runtime"
require "rails_fast_attributes/native"
require "rails_fast_attributes/version"

module RailsFastAttributes
  ORIGINAL_ATTRIBUTE = ActiveRecord::Attribute

  def Attribute.inherited(*)
    raise "ActiveRecord::Attribute cannot be subclassed when using rails_fast_attributes"
  end

  def Attribute.null(name)
    ORIGINAL_ATTRIBUTE.null(name)
  end
end

ActiveRecord::Attribute = RailsFastAttributes::Attribute
ActiveRecord::AttributeSet::Builder = RailsFastAttributes::Builder
