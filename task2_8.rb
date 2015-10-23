# Class
class Class
  def attr_accessor_with_history(attr_name)
    attr_reader attr_name.to_s, attr_name.to_s + '_history'
    class_eval %"
      def #{attr_name}=(value)
        if !defined? @#{attr_name}_history
          @#{attr_name}_history = [@#{attr_name}]
        end
        @#{attr_name} = value
        @#{attr_name}_history << value
      end
    "
  end
end

# Foo
class Foo
  attr_accessor_with_history :bar
end
