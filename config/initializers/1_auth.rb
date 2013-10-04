module ExampleApp
  class AuthConfig < Settingslogic
    source "#{Rails.root}/config/auth.yml"
    namespace Rails.env
    load!
  end
end


# TODO: confirm that full_host is no longer needed in dev
# full_host = '' # set to url as needed
# OmniAuth.config.full_host = full_host if full_host.present?

ExampleApp::Application.config.middleware.use OmniAuth::Builder do
  ExampleApp::AuthConfig.providers.each do |k, v|
    opts = (v.try(:[], 'oauth') || {}).symbolize_keys
    provider k, v['key'], v['secret'], opts
  end

  on_failure = Proc.new do |env|
    OAuthController.action(:on_omniauth_failure).call(env)
  end
end