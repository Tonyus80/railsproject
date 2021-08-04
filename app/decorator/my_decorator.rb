
class MyDecorator < SimpleDelegator


  # Profile Automatic Convert the lowercase letters to all capitals
  def capitalize_pps_num
    pps_num.upcase
  end

  # Patient conversion Automatic Convert the lowercase letters to all capitals
  def capitalize_pat_pps_num
    pps.upcase
  end

  # Display User Role/Status
  # def show_status
  #   "Admin status:#{admin}"
  # end

  ###Display different color for Admin and User
  def show_status
    "Admin status:#{admin}"
    admin

    #if (!!admin)== "True"
      if (admin)== true
      #if status_admin.to_str.include? "True"
        '<li><span  class="fas fa-user-cog-margin:20px; " style = "margin:30px; color: green;font-weight:bold;font-size: 18px;">Admin Status : Yes </span ></li>'.html_safe
      else

        '<li><span  class="fas fa-user-cog-margin:20px; " style = "margin:30px; color: red;font-weight:bold;font-size: 18px;">Admin Status : No </span ></li>'.html_safe

      end

  end

  #Split mail
  def split_email(email)

    #email.split(/\s|,/)
    email.split('@')[0] ## First value will be the unique identifier of each user
  end

  #Method tha concatenate First and last name of the doctor
  def con_firstname_lastname
    "#{firstname} #{lastname}"
  end

  #Method tha concatenate First and last name of the doctor
  def concat_pat_name_surname
    "#{name} #{surname}"
    #"#{name} #{surname}"
  end



end