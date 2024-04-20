class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def options_links_user
    case rol
    # user
    when 0
      [
        {
          'path_url' => h.dashboard_admin_users_path,
          'path_svg' => 'M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z',
          'name' => 'Dashboard'
        }

      ]
    # admin
    when 1
      [
        {}
      ]
    end
  end

  def options_header
    [
      {
        'name' => 'Nombre',
        'size' => '10%'
      },
      {
        'name' => 'Rol',
        'size' => '10%'
      },
      {
        'name' => 'Correo electronico',
        'size' => '20%'
      },
      {
        'name' => 'Fecha de Nacimiento',
        'size' => '20%'
      },
      {
        'name' => '',
        'size' => '30%'
      }
    ]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def show_rol
    rol == 0 ? 'Cliente' : 'Administrador'
  end
end
