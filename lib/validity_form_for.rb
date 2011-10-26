module ActionView
  module Helpers
    module FormHelper

      def form_for_with_validity(object, *args, &proc)
        if object.is_a?(ActiveRecord::Base)
          render :partial => "shared/validity_now", :locals => {:object => object.class}
        end
        form_for_without_validity(object, *args, &proc)
      end

      alias_method_chain :form_for, :validity
    end
  end
end
