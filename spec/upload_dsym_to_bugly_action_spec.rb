describe Fastlane::Actions::UploadDsymToBuglyAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The upload_dsym_to_bugly plugin is working!")

      Fastlane::Actions::UploadDsymToBuglyAction.run(nil)
    end
  end
end
