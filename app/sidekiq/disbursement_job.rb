# frozen_string_literal: true

# Background job that runs on every monday you can change time to edit config/schedule.yml
class DisbursementJob
  include Sidekiq::Job

  sidekiq_options queue: :default

  # create disbursement record for completed orders on every monday
  def perform(*_args)
    Sequra::DisburseService.call
  end
end
