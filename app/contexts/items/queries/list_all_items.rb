module Contexts
    module Items
        module Queries
            class ListAllItems

                def call()
                    item ||= Item.all
                    raise Contexts::Items::Errors::ItemNotFoundError if item == []
      
                    item
                end
            end
        end
    end
end