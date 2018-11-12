require 'fastlane/action'
require_relative '../helper/upload_dsym_to_bugly_helper'

module Fastlane
  module Actions
    class UploadDsymToBuglyAction < Action
      def self.run(params)
        UI.message("The upload_dsym_to_bugly plugin is working!")
      end

      def self.description
        "upload_dsym_to_bugly"
      end

      def self.authors
        ["liubo"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        ""
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "UPLOAD_DSYM_TO_BUGLY_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :api_version,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_API_VERSION",
                               description: "api version for UploadDsymToBuglyAction",
                                 is_string: false,
                             default_value: 1),
          FastlaneCore::ConfigItem.new(key: :app_id,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_APP_ID",
                               description: "app id for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                UI.user_error!("No APP id for UploadDsymToBuglyAction given, pass using `app_id: 'app_id'`") unless (value and not value.empty?)
                              end),
          FastlaneCore::ConfigItem.new(key: :app_key,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_APP_KEY",
                               description: "app key for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                UI.user_error!("No APP key for UploadDsymToBuglyAction given, pass using `api_key: 'app_key'`") unless (value and not value.empty?)
                              end),
          FastlaneCore::ConfigItem.new(key: :symbol_type,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_SYMBOL_TYPE",
                               description: "symbol type for UploadDsymToBuglyAction",
                                 is_string: false,
                              verify_block: proc do |value|
                                UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `symbol_type: 'symbol_type'`") unless (value and not value.to_s.empty?)
                              end),                                 
          FastlaneCore::ConfigItem.new(key: :bundle_id,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_BUNDLE_ID",
                               description: "bundle id for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                  UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `bundle_id: 'bundle_id'`") unless (value and not value.empty?)
                              end),
          FastlaneCore::ConfigItem.new(key: :product_version,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_PRODEUCT_VERSION",
                               description: "product version for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `product_version: 'product_version'`") unless (value and not value.empty?)
                              end),
          FastlaneCore::ConfigItem.new(key: :channel,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_CHANNEL",
                               description: "channel for UploadDsymToBuglyAction",
                                 is_string: true,
                             default_value: "fastlane"),
          FastlaneCore::ConfigItem.new(key: :file_name,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_FILE_NAME",
                               description: "file name for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `file_name: 'file_name'`") unless (value and not value.empty?)
                              end),
          FastlaneCore::ConfigItem.new(key: :file_path,
                                  env_name: "FL_UPLOAD_DSYM_TO_BUGLY_FILE",
                               description: "file for UploadDsymToBuglyAction",
                                 is_string: true,
                              verify_block: proc do |value|
                                UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `file_path: 'file_path'`") unless (value and not value.empty?)
                              end)
        ]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
