
class MyDecorator < SimpleDelegator


  # Profile Automatic Convert the lowercase letters to all capitals
  def capitalize_pps_num
    pps_num.upcase
  end

  # Patient conversion Automatic Convert the lowercase letters to all capitals
  def capitalize_pat_pps_num
    pps.upcase
  end

  # User Role/Status
  def show_status
    "Admin status:#{admin}"
  end









end