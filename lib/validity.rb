module Validity
  def self.included(base)
    base.extend(ClassMethods)
    base.class_eval do
      class << self
        alias_method_chain :validates_presence_of, :validity
        alias_method_chain :validates_numericality_of, :validity
        alias_method_chain :validates_format_of, :validity
        alias_method_chain :validates_length_of, :validity
      end
    end
  end

  module ClassMethods

    @@validations = {}
    mattr_accessor :validations

    def validates_presence_of_with_validity(*attr_names)
      if @@validations.keys.include?(:presence_of)
        @@validations[:presence_of] << attr_names
      else
        @@validations[:presence_of] = [attr_names]
      end
      validates_presence_of_without_validity(attr_names)
    end

    def validates_length_of_with_validity(*attr_names)
      if @@validations.keys.include?(:length_of)
        @@validations[:length_of] << attr_names
      else
        @@validations[:length_of] = [attr_names]
      end
      validates_length_of_without_validity(*attr_names)
    end

    def validates_numericality_of_with_validity(*attr_names)
      if @@validations.keys.include?(:numericality_of)
        @@validations[:numericality_of] << attr_names
      else
        @@validations[:numericality_of] = [attr_names]
      end
      validates_numericality_of_without_validity(attr_names)
    end

    def validates_format_of_with_validity(*attr_names)
      if @@validations.keys.include?(:format_of)
        @@validations[:format_of] << attr_names
      else
        @@validations[:format_of] = [attr_names]
      end
      validates_format_of_without_validity(*attr_names)
    end
  end
end

class ActiveRecord::Base
  include Validity
end
