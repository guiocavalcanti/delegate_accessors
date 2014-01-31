require "active_support/core_ext"
require "delegate_accessors/version"

puts  "eval"
module DelegateAccessors
  extend ActiveSupport::Concern

  module ClassMethods
    def delegate_accessors(*methods)
      options = methods.pop

      accessors = methods.reduce([]) do |acc, method|
        acc + [method, "#{method}="]
      end

      delegate *(accessors << options)
    end
  end
end
