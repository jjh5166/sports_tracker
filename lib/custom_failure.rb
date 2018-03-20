class CustomFailure < Devise::FailureApp

  def redirect_url
    session["user_return_to"] 
  end
  def respond
    if http_auth?
      http_auth
	else
      redirect
    end
  end
end