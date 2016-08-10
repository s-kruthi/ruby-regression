Dir["./features/lib/android/**/*.rb"].each {|file| require file unless file == "method_factory.rb" }


module Android
  module MethodFactory
    include ::Android::Capabilities
    include ::Android::StartMethod
  end
end