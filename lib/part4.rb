class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s # make sure it's a string
        attr_reader attr_name
        attr_reader attr_name+"_history"
        class_eval %Q{
        # setter
            def #{attr_name}=(new_attr_value)
                if @#{attr_name}_history.nil?
                    @#{attr_name}_history = [nil]
                end
                @#{attr_name}_history << new_attr_value
                @#{attr_name} = new_attr_value
          end
        #   getter
            def #{attr_name}_history
                @#{attr_name}_history
            end
        }
    end
end

class Foo
    attr_accessor_with_history :bar
end