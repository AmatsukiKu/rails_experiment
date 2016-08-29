package 'ruby2.3'

# nokogiriのインストールに必要
package 'build-essential'
package 'patch'
package 'ruby-dev'
package 'zlib1g-dev'
package 'liblzma-dev'

gem_package 'rails'

execute 'rails new' do
  not_if 'ls rails_experiment'
  command 'rails new rails_experiment -O -J -T -S'
  user 'ubuntu'
  cwd '/home/ubuntu'
end
execute 'append rspec-rails to Gemfile' do
  not_if 'grep rspec-rails Gemfile'
  command 'echo "gem \'rspec-rails\'" >> Gemfile'
  user 'ubuntu'
  cwd '/home/ubuntu/rails_experiment'
end
execute 'bundle install' do
  command 'bundle install'
  user 'ubuntu'
  cwd '/home/ubuntu/rails_experiment'
end
execute 'generate rspec:install' do
  not_if 'ls spec'
  command 'bundle exec rails generate rspec:install'
  user 'ubuntu'
  cwd '/home/ubuntu/rails_experiment'
end
