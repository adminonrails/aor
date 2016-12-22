class Admin::MainController < Admin::BaseController
  skip_before_action :login_required, only: [:login]
  skip_before_action :authorize_admin, only: [:login]
  def login
    adm_user = AdmUser.first
    adm_user = AdmUser.create!(email: 'admin@admin.com', password: '1234abcd') if adm_user.nil?
    self.current_user_form_session = adm_user
  end
end
