class OmniauthCallbacksController < ApplicationController
  def twitter
    twitter_accounts = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
    twitter_accounts.update(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to twitter_accounts_path, notice: "Sucessfully connected your account"
  end
  
  def auth
    request.env['omniauth.auth']
  end
end