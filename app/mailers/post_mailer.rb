class PostMailer < ActionMailer::Base
  # each method is a mail that you want to send
  # each method has a respective view
  def post_created(user, post) # this method is informed by the $file_names in post_mailer folder
    

    attachments['hello_there.pdf'] = File.read('tmp/x.pdf')
    mail(to: user.email,
        from: "fxkennyfrc@gmail.com", # if you use the gmail stmp, this will override
        subject: post.title,
        body: post.content
    ) # the argument inside here is a hash, and the hash contents are the email contents
  end
  # you want to then #call this $mailer and the $method in the controller
  # go to the specific action

end