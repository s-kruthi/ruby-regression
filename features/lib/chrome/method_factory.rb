Dir["./features/lib/chrome/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Chrome
  module MethodFactory
    include ::Chrome::Capabilities
    include ::Chrome::StartMethod
  end
end