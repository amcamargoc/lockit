u = User.new(
  email: 'lockit@anyon.com', password: 'secretsecret',
  full_name: 'Anyon Holding GmbH', identification: '123434234897342'
)
u.add_role :admin

u.confirm
