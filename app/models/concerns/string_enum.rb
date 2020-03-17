# Concern module that handles intialization and validation using string in enum
#
# @author Mc Dave Valdecantos
#
# @reference https://api.rubyonrails.org/v5.2.4.1/classes/ActiveRecord/Enum.html
#
# @implementation tests
#   1. Column constant is available
#   2. Scope is availale and returning the right result
#   3. Mutation and Checking instance method are availabile
#   4. Validates inclusion in column value and if allowed blank
module StringEnum
  extend ActiveSupport::Concern

  included do
    private_class_method :enum_init, :add_method, :add_scope, :set_constant
  end

  class_methods do
    # Initialization of string enum
    #
    # @param [Hash]
    # @return [Void]
    #
    # @usage
    #   enum_init column: ["String", "String"], allow_blank: true (Optional)
    def enum_init(**hash)
      name, values = hash.first

      set_constant(name, values)

      values.each do |value|
        add_method(name, value)
        add_scope(name, value)
      end

      validates name, inclusion: { in: values },
                      allow_blank: hash.fetch(:allow_blank) { false }
    end

    # Adding dynamic instance methods
    #
    # @param [String] name the method name
    # @param [String] value the object attribute name
    # @return [Void]
    def add_method(name, value)
      define_method "#{value.parameterize.underscore}?" do
        self[name] == value
      end

      define_method "#{value.parameterize.underscore}!" do
        update(name => value)
      end
    end

    # Initializing class records scope
    #
    # @param [String] name the scope name
    # @param [String] value the scope filter matching data
    # @return [Void]
    def add_scope(name, value)
      scope value.parameterize.underscore.to_sym, -> { where(name => value) }
    end

    # Setting of class constants
    #
    # @param [String] name the constant name
    # @param [Array<String>] values the constant values
    # @return [Void]
    def set_constant(name, values)
      const_set(name.to_s.pluralize.upcase, values.freeze)
    end
  end
end
