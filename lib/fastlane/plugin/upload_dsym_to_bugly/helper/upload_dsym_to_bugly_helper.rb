require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class UploadDsymToBuglyHelper
      # class methods that you define here become available in your action
      # as `Helper::UploadDsymToBuglyHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the upload_dsym_to_bugly plugin helper!")
      end
    end
  end
end
