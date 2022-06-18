module Contexts
    module Items
      module Errors
        class ItemNotFoundError < ActiveRecord::RecordNotFound;
          def message
            "Items were not found"
          end
        end
      end
    end
  end