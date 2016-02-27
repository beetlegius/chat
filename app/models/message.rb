class Message < ApplicationRecord

  default_scope -> { order created_at: :desc }

  after_create_commit { MessageBroadcastJob.perform_later self }
  
end
