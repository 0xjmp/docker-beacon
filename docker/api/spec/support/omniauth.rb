module OmniAuthSupport
  def self.build_strategy(provider)
    case provider
    when :developer
      DeveloperStrategy.build
    end
  end

  class OmniAuthStrategy
    def self.build
      raise NoMethodError, 'Unimplemented strategy'
    end
  end

  class DeveloperStrategy < OmniAuthStrategy
    def self.build
      OmniAuth.config.mock_auth[:developer] = OmniAuth::AuthHash.new({
        provider: 'developer',
        uid: '12345'
      })
    end
  end
end