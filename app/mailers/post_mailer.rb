class PostMailer < ActionMailer::Base

  # each method is a mail that you want to send
  # each method has a respective view
  def post_created(user) # this method is informed by the $file_names in post_mailer folder
    mail(to: user.email,
        from: "services@gmail.com", # if you use the gmail stmp, this will override
        subject: "Post Created!",
        body: "This si my first mailer!"
    ) # the argument inside here is a hash, and the hash contents are the email contents
  end
  # you want to then #call this $mailer and the $method in the controller
  # go to the specific action

end