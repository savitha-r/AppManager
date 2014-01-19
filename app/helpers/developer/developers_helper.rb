module Developer::DevelopersHelper
  
  def set_company(company)
    cookies.permanent[:company_token] = company.id
    self.current_company = company
  end

  def current_company=(company)
    @current_company = company
  end

  def current_company
    if @current_company.nil? and cookies[:company_token].nil?
      return nil
    end
    @current_company ||= Company.find_by_id(cookies[:company_token])
  end

  def sign_out
    self.current_company = nil
    cookies.delete(:company_token)
  end

  def current_company?(company)
      company == current_company
  end
end
