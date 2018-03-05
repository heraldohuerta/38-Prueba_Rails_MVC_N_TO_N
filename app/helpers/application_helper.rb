module ApplicationHelper
  def isadmin?
    verifica_admin = User.find(current_user.id)
    if verifica_admin.nil?
       redirect_to root_path, notice: 'Problemas para encontrar el usuario.'
    end

    if verifica_admin.admin
      true
    else
      false
    end
  end

  def count_list()
    if !current_user.nil?
      user = User.find(current_user.id)
      userlist = 0
      userlist = user.user_lists.where(estatus: :true).count
    end
  end


  def miestado(id_list)
    if !current_user.nil?
        userlist = UserList.where(user_id:current_user.id,list_id: id_list)
        if userlist.count > 0
          userlist.take.estatus
        end
    else
       false
    end
  end
end
