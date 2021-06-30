# upload_dsym_to_bugly plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-upload_dsym_to_bugly)


## Note
2021 年 6 月 28 日 开始，bugly 不再支持使用 openApi 的方式上传符号表，需要使用官方提供的命令行上传工具进行上传。
本插件当前使用的工具版本为：__3.3.4__

另外去除了上传 ipa 到 bugly 的 action。

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-upload_dsym_to_bugly`, add it to your project by running:

```shell
$ fastlane add_plugin upload_dsym_to_bugly
```

add the following to your `fastfile`
```ruby
lane :upload_dysm do
    upload_dsym_to_bugly(
      file_path: "<path/to/your/x.app.dSYM.zip",
      app_key: "<your app_key>",
      app_id:"<your app_id>",
      bundle_id: '<your bundle id>',
      version: get_version_number,
      raise_if_error: false
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
