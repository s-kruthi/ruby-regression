class DeviceMethodFactory

  def self.for_channel channel_name
    require "./features/lib/#{channel_name}/method_factory"

    if channel_name == "android"
        return Android::MethodFactory
        end
    if channel_name == "ios"
      return IOS::MethodFactory
      end
    if channel_name == "firefox"
      return Firefox::MethodFactory
    end
    if channel_name == "chrome"
      return Chrome::MethodFactory
    end
    if channel_name == "safari"
      return Safari::MethodFactory
    end

  end
  STEP_PAUSE = (ENV['STEP_PAUSE'] || 2).to_f
end