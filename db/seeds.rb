u = User.save email: 'lockit@anyon.com', password: 'secretsecret'
u.confirm
u.add_role :admin
