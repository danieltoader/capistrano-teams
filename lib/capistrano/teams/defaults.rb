# Teams defaults

# set :teams_webhook_url,  "url"
set :teams_suppress_events, false
set :teams_message_type, Message::TYPE_BASIC # Message::TYPE_BASIC or Message::TYPE_CARD
set :teams_http_options, verify_mode: OpenSSL::SSL::VERIFY_PEER

# Theme colors
set :teams_starting_color, '0033CC'
set :teams_reverting_color, 'FFFF00'
set :teams_finishing_color, '00FF00'
set :teams_rollback_color, 'FFFF00'
set :teams_failed_color, 'FF0000'

# Statuses
set :teams_starting_status, 'STARTING'
set :teams_reverting_status, 'REVERTING'
set :teams_finishing_status, 'FINISHED'
set :teams_rollback_status, 'ROLLBACK'
set :teams_failed_status, 'FAILED'

# Used for Message::TYPE_BASIC
set :teams_basic_message_title, 'Deployment Notice » %<application>s'
set :teams_basic_message_text, '<h1>Deploy on <strong>%<stage>s</strong> by ' \
      '<strong>%<user>s</strong></h1> ' \
      "Branch: %<branch>s \n\n" \
      'Status: %<status>s'

# Used for Message::TYPE_CARD
set :teams_card_message_title, 'Deployment Notice » %<application>s'
set :teams_card_message_sub_title, 'On %<stage>s'
set :teams_card_message_image, ''
set :teams_card_message_summary, 'Deploy for %<application>s on %<stage>s by %<user>s'
set :teams_card_message_markdown, false

# Default values
set :teams_default_color, '333333'
set :teams_default_status, 'UNKNOWN'
set :teams_default_application, 'N/A'
set :teams_default_branch, 'N/A'
set :teams_default_stage, 'N/A'
set :teams_default_user, 'UNKNOWN'
