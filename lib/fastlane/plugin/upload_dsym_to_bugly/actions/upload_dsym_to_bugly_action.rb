require "fastlane/action"
require_relative "../helper/upload_dsym_to_bugly_helper"
require 'fileutils'

module Fastlane
  module Actions
    module SharedValues
      UPLOAD_DSYM_TO_BUGLY_RESULT = :UPLOAD_DSYM_TO_BUGLY_RESULT
    end
    class UploadDsymToBuglyAction < Action
      def self.run(params)

        jar_path = File.expand_path('../../jars/buglyqq-upload-symbol-3.3.4.jar', __FILE__)
        UI.message "jar path: #{jar_path}"

        file_path = File.expand_path("#{params[:file_path]}")
        UI.message "file path: #{file_path}"

        unzip_path = File.expand_path(".upload_dsym_to_bugly_tmp", "#{File.dirname("#{file_path}")}") 
        UI.message "unzip path: #{unzip_path}"

        if Dir.exist?(unzip_path)
          FileUtils.rm_r(unzip_path, force: true)
        end

        if !Dir.glob(file_path).empty?
            sh("unzip -o #{file_path} -d #{unzip_path}")
        else
          UI.message "dSYM zip File don't exist"
          Actions.lane_context[SharedValues::UPLOAD_DSYM_TO_BUGLY_RESULT] = false
          raise if params[:raise_if_error]
        end
        cmd = "java -jar #{jar_path} -appid #{params[:app_id]} -appkey #{params[:app_key]} -bundleid #{params[:bundle_id]} -version #{params[:version]} -platform #{params[:platform]} -inputSymbol #{unzip_path}"

        log_file = "dSYM_upload_result.log"

        begin
          sh("#{cmd} > #{log_file}")
          last_line = sh("tail -n 1 #{log_file}")

          success = last_line.include?("retCode: 200") and last_line.include?("\"msg\":\"success\"")
          if success
            UI.message "dSYM upload successfully 🎉 "            
            Actions.lane_context[SharedValues::UPLOAD_DSYM_TO_BUGLY_RESULT] = true
          else
            UI.message "dSYM upload failed: #{last_line}"
            Actions.lane_context[SharedValues::UPLOAD_DSYM_TO_BUGLY_RESULT] = false
            raise if params[:raise_if_error]        
          end

        rescue => exception
          UI.message "dSYM upload failed, See log output above"
          Actions.lane_context[SharedValues::UPLOAD_DSYM_TO_BUGLY_RESULT] = false
          raise if params[:raise_if_error]
        end
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
          FastlaneCore::ConfigItem.new(key: :app_id,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_APP_ID",
                                       description: "app id",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No APP id for UploadDsymToBuglyAction given, pass using `app_id: 'app_id'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :app_key,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_APP_KEY",
                                       description: "app key",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No APP key for UploadDsymToBuglyAction given, pass using `api_key: 'app_key'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :bundle_id,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_BUNDLE_ID",
                                       description: "bundle id",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `bundle_id: 'bundle_id'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :version,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_VERSION",
                                       description: "app version",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `version: 'version'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :file_path,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_FILE",
                                       description: "file path",
                                       is_string: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("No symbol type for UploadDsymToBuglyAction given, pass using `file_path: 'file_path'`") unless (value and not value.empty?)
                                       end),
          FastlaneCore::ConfigItem.new(key: :platform,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_FILE",
                                       description: "platform",
                                       is_string: true,
                                       default_value: "IOS",
                                       verify_block: proc do |value|
                                         UI.user_error!("platform value error, available values: IOS, Android") unless (value == "IOS" or value == "Android")
                                      end),
          FastlaneCore::ConfigItem.new(key: :raise_if_error,
                                       env_name: "FL_UPLOAD_DSYM_TO_BUGLY_RAISE_IF_ERROR",
                                       description: "Raises an error if fails, so you can fail CI/CD jobs if necessary \(true/false)",
                                       default_value: true,
                                       is_string: false,
                                       type: Boolean,
                                       optional: false)
        ]
      end

      def self.output
        [
          ["UPLOAD_DSYM_TO_BUGLY_RESULT", "upload result"],
        ]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
