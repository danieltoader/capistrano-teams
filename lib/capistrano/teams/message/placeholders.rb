# frozen_string_literal: true

module Message
  # Placeholder
  class Placeholders
    attr_reader :placeholders

    def initialize(placeholders)
      @placeholders = defaults.merge(placeholders)
    end

    private

    def defaults
      {
        application: fetch(:application, fetch(:teams_default_application)),
        branch: fetch(:branch, fetch(:teams_default_branch)),
        stage: fetch(:stage, :teams_default_stage),
        user: ENV.fetch('USER', ENV.fetch('USERNAME', :teams_default_user))
      }
    end
  end
end
