# frozen_string_literal: true

require 'capistrano/teams/message/placeholders'

module Message
  TYPE_BASIC = 1
  TYPE_CARD = 2
  # Message builder class
  class Builder
    def self.of_type(type, placeholder_list, theme_color, facts)
      case type
      when Message::TYPE_BASIC
        Basic.new(placeholder_list, theme_color, facts)
      when Message::TYPE_CARD
        MessageCard.new(placeholder_list, theme_color, facts)
      else
        raise 'Capistrano Teams: Unknown message type'
      end
    end
  end

  # Type
  class Type
    def initialize(placeholder_list, theme_color, facts = [])
      @placeholder_list = placeholder_list
      @theme_color = theme_color
      @facts = facts
    end

    def placeholders
      Message::Placeholders.new(@placeholder_list).placeholders
    end

    def content
      raise 'Abstract method called'
    end
  end

  # Basic type
  class Basic < Type
    # Get the body of the POST message as JSON.
    def content
      {
        title: fetch(:teams_basic_message_title),
        text: fetch(:teams_basic_message_text),
        themeColor: @theme_color
      }.to_json % placeholders
    end
  end

  # MessageCard type
  class MessageCard < Type
    # Get the body of the POST message as JSON.
    def content
      {
        '@type' => 'MessageCard',
        '@context' => 'http://schema.org/extensions',
        'themeColor' => @theme_color,
        'summary' => fetch(:teams_card_message_summary),
        'sections' => sections,
        'potentialAction' => []
      }.to_json % placeholders
    end

    private

    def sections
      [{
        'activityTitle' => fetch(:teams_card_message_title),
        'activitySubtitle' => fetch(:teams_card_message_sub_title),
        'activityImage' => fetch(:teams_card_message_image),
        'facts' => facts,
        'markdown' => fetch(:teams_card_message_markdown)
      }]
    end

    def facts
      [
        {
          'name' => 'Deploy by',
          'value' => '%<user>s'
        },
        {
          'name' => 'Branch',
          'value' => '%<branch>s'
        },
        {
          'name' => 'Deploy date',
          'value' => Time.now.strftime('%d/%m/%Y %H:%M:%S')
        }, {
          'name' => 'Status',
          'value' => '%<status>s'
        }
      ].concat(@facts)
    end
  end
end
