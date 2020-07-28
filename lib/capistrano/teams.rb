require 'rake'
require 'capistrano/teams/version'
require 'capistrano/teams/message/types'

# Core tasks for teams integration
load File.expand_path('tasks/teams.rake', __dir__)

namespace :deploy do
  before 'deploy:starting', 'teams:deploy:starting'
  before 'deploy:reverting', 'teams:deploy:reverting'
  after 'deploy:finishing', 'teams:deploy:finishing'
  after 'deploy:finishing_rollback', 'teams:deploy:finishing_rollback'
  after 'deploy:failed', 'teams:deploy:failed'
end

namespace :load do
  task :defaults do
    load 'capistrano/teams/defaults.rb'
  end
end
