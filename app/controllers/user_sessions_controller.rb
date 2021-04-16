class UserSessionsController < ApplicationController

  def new
    @session = UserSession.new(session)
  end

  def create
    @session = UserSession.new(session, params[:user_session])
    if @session.authenticate
      # Adicionar a chave no I18n
      redirect_to root_path, :notice => t('flash.notice.signed_in')
      #redirect_to user, :notice => I18n.t('users.confirmations.success')
    else
      render :new
    end
  end

  def destroy
  end


end