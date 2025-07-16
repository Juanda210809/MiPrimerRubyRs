class EnviarCorreoJob < ApplicationJob
  queue_as :default

  def perform(email)
    CorreoMailer.saludo(email).deliver_now
  end
end
