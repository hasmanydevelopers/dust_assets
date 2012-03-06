require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Runs the test suite'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end
  