# 环境配置-Win

> ...

- rubyinstaller-2.3.1.exe
- DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe

```
# 安装Ruby：rubyinstaller-2.3.1.exe

# 安装DevKit：DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe

cd C:\rubydevkit

ruby dk.rb init
ruby dk.rb install

# 删除官方链接
gem sources --remove https://rubygems.org/  

# 添加淘宝镜像链接
gem source -a http://gems.ruby-china.org/

# 查询是否替换成功
gem sources -l

# 更新RubyGems软件
gem update --system

gem install rails

# 安装jekyll
gem install jekyll

# 安装rdiscount，这个是用来解析Markdown标记的解析包。
gem install rdiscount

jekyll -v

```
