Dir["./features/lib/safari/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Safari
  module MethodFactory
    include ::Safari::Capabilities
    include ::Safari::StartMethod
    include ::Safari::Touch_Methods
    include ::Safari::Verify_Methods
    include ::Safari::Wait_Methods
    include ::Safari::Input_Methods
    include ::Safari::Custom_Methods
  end
end