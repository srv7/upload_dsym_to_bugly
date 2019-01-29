# upload_dsym_to_bugly plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-upload_dsym_to_bugly)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-upload_dsym_to_bugly`, add it to your project by running:

```shell
$ fastlane add_plugin upload_dsym_to_bugly
```

add the following to your `fastfile`
```ruby
lane :upload_dysm do
    upload_dsym_to_bugly(
      file_path: "<your dSYM.zip path>",
      file_name: "<your dSYM.zip name>",
      app_key: "<your app_key>",
      app_id:"<your app_id>",
      api_version: 1,
      symbol_type: 2, # iOS => 2, Android => 1
      bundle_id: '<your bundle id>',
      product_version: `/usr/libexec/PlistBuddy -c \"print CFBundleShortVersionString\" \"<path/to/your/Info.plist>\"`,
    )
end
```

if you want to upload your ipa to bugly, add the following to your `fastfile`
```ruby
lane :upload_ipa do
    upload_app_to_bugly(
      file_path:"<your *.ipa filepath>",
      app_key:"<your app_key>",
      app_id:"<your app_id>",
      pid:"2",
      title:"<title>",
      desc:"<description>",
      secret:"<secret>",
      users:"<users>",
      password:"<password>",
      download_limit:download_limit
    )
end

```

## About upload_dsym_to_bugly

upload dSYM to bugly

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).


## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
