
Dir["./features/lib/ios/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module IOS
  module MethodFactory
    include ::IOS::Capabilities
    include ::IOS::StartMethod
  end
end