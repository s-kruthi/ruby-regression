Dir["./features/lib/safari/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }

module Safari
  module MethodFactory
    include ::Safari::Capabilities
    include ::Safari::StartMethod
  end
end