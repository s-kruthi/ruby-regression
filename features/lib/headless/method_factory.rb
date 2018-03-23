Dir["./features/lib/headless/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Headless
  module MethodFactory
    include ::Headless::Capabilities
    include ::Headless::StartMethod
    include ::Headless::Touch_Methods
    include ::Headless::Verify_Methods
    include ::Headless::Wait_Methods
    include ::Headless::Input_Methods
    include ::Headless::Custom_Methods
  end
end