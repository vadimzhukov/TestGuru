module RootHeaderHelper
  def root_header_helper(user)
    if user&.admin?
      admin_tests_path
    else
      root_path
    end
  end
end
