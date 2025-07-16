class CorreoMailer < ApplicationMailer
  default from: 'guarnizoj032@gmail.com'

  def saludo(email)
    @email = email
    mail(to: email, subject: 'Un saludo desde la app Rails, enviando primer correo')
  end
end
