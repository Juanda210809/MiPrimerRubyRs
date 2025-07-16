# Preview all emails at http://localhost:3000/rails/mailers/correo_mailer
class CorreoMailerPreview < ActionMailer::Preview
default from: 'guarnizoj032@gmail.com'

def saludo(email)
  @email = email
  mail(to:email, subject: 'Un saludo desde la app Rails, enviando primer correo')
end
end
