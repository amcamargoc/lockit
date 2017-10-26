# Administrator
u = User.new(
  email: 'lockit@anyon.com', password: 'secretsecret',
  full_name: 'Anyon Holding GmbH', identification: Faker::Code.imei
)
u.add_role :admin
u.confirm

# receptionist
0.upto(9).each do |_|
  u = User.new(
    email: Faker::Internet.unique.email, password: 'secretsecret',
    full_name: Faker::Name.name, identification: Faker::Code.imei
  )
  u.add_role :receptionist
  u.confirm
end

# Recipient
0.upto(9).each do |_|
  Recipient.create(
    email: Faker::Internet.unique.email, phone_number: Faker::PhoneNumber.cell_phone,
    full_name: Faker::Name.name, identification: Faker::Code.imei
  )
end

# Locker

QRS_IMAGES = [
  'https://smallbiztrends.com/wp-content/uploads/2015/05/qr-code-sample.jpg',
  'https://cdn.vox-cdn.com/uploads/chorus_asset/file/6789923/QtIH2u6.0.png',
  'http://qrcode.meetheed.com/images/qr_code_art27.jpg',
  'https://png.icons8.com/qr-code/android/1600',
  'http://worldbarcodes.com/wp-content/assets/sites/20/QR-Code-Standard1.jpg'
]

ids = Recipient.pluck(:id)
0.upto(4).each do |_|
  l = LockerBox.create(
        name: Faker::Company.unique.name,
        identification: Faker::Company.norwegian_organisation_number,
        description: Faker::Lorem.paragraph,
        total_capacity: Faker::Number.decimal(6).to_f
      )
  total_capacity = 0
  0.upto(1).each do |_|
    capicity = Faker::Number.decimal(3).to_f
    total_capacity += capicity
    l.parcels.create(
      capicity: capicity,
      recipient_id: ids.pop,
      name: Faker::Lorem.word,
      label_photo: QRS_IMAGES.sample
    )
  end

  l.update(used_capacity: total_capacity)
end
