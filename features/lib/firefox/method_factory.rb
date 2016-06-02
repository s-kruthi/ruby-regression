Dir["./features/lib/firefox/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Firefox
  module MethodFactory
    include ::Firefox::Capabilities
    include ::Firefox::StartMethod
    include ::Firefox::Touch_Methods
    include ::Firefox::Verify_Methods
    include ::Firefox::Wait_Methods
  end
end