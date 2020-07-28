require 'capistrano/teams/web_hook'
require 'capistrano'

namespace :teams do
  task :notify, :status, :facts, :theme_color do |task, args|
    send_notification(
      args[:status] || fetch(:teams_default_status),
      args[:theme_color] || fetch(:teams_default_color),
      args[:facts] || []
    )
    task.reenable
  end
  namespace :deploy do
    task :starting do |task|
      notify_event(fetch(:teams_starting_status), fetch(:teams_starting_color))
      task.reenable
    end

    task :reverting do |task|
      notify_event(fetch(:teams_reverting_status), fetch(:teams_reverting_color))
      task.reenable
    end

    task :finishing do |task|
      notify_event(fetch(:teams_finishing_status), fetch(:teams_finishing_color))
      task.reenable
    end

    task :finishing_rollback do |task|
      notify_event(fetch(:teams_rollback_status), fetch(:teams_rollback_color))
      task.reenable
    end

    task :failed do |task|
      notify_event(fetch(:teams_failed_status), fetch(:teams_failed_color))
      task.reenable
    end
  end
end

def send_notification(status, color, facts)
  Capistrano::Teams::WebHook.new.notify(status, color, facts)
  puts "'#{status.capitalize}' event notification sent to teams."
end

def notify_event(status, color)
  if fetch(:teams_suppress_events) == false
    send_notification(status, color, [])
  else
    puts 'Notification not sent, `teams_suppress_events` is set to true or is invalid.'
  end
end
