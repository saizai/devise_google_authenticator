module DeviseGoogleAuthenticator
  module Generators # :nodoc:
    # Install Generator
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Install the devise google authenticator extension"

      def add_configs
        inject_into_file "config/initializers/devise.rb", "\n  # ==> Devise Google Authenticator Extension\n  # Configure extension for devise\n\n" +
        "  # How long should the user have to enter their token. To change the default, uncomment and change the below:\n" +
        "  # config.ga_timeout = 3.minutes\n\n" +
        "  # Change time drift settings for valid token values. To change the default, uncomment and change the below:\n" +
        "  # config.ga_timedrift = 3\n\n" +
        "\n", :before => /end[ |\n|]+\Z/
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise.google_authenticator.en.yml"
      end
    end
  end
end