module DeviseHelpers
  def devise_mapping(scope = :user)
    @request.env["devise.mapping"] = Devise.mappings[scope]
  end

  def create(scope: :user, trait: nil)
    FactoryGirl.create(scope, trait)
  end

  def create_prospective(scope: :user, trait: nil)
    FactoryGirl.attributes_for(scope, trait)
  end
end
