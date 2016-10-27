# Aor:Bootstrap
Bootstrap 的 Rails 包装,和官方的 [bootstrap-rubygem](https://github.com/twbs/bootstrap-rubygem) 相比,主要去掉 Sass 依赖,直接使用编译出来的 css 文件,然后改成 erb 模板,替换 font 路径为 asset_path 方式.

## Usage
在 application.css 和 application.js 里面 `require bootstrap` 即可.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'aor-bootstrap'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install aor-bootstrap
```

## Update
修改 lib/aor/bootstrap/version.rb 的 BOOTSTRAP_VERSION 常量,之后执行下面命令即可.

```bash
bundle exec rake update_bootstrap
bundle exec rake test
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
