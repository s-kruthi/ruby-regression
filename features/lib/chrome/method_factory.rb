Dir["./features/lib/chrome/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Chrome
  module MethodFactory
    include ::Chrome::Capabilities
    include ::Chrome::StartMethod
    include ::Chrome::Touch_Methods
    include ::Chrome::Verify_Methods
    include ::Chrome::Wait_Methods
    include ::Chrome::Input_Methods
    include ::Chrome::Custom_Methods
  end
end