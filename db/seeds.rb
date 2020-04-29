fnames = %w[Taro Jiro Hana Jhon Mike]
gnames = %w[Yamada Tanaka Suzuki Smith]

(1..5).each do |num|
  User.create(name: "#{fnames[num % 5]}#{gnames[num % 4]}", email: "#{fnames[num % 5]}@ta.com", password: "#{fnames[num % 5]}1234")
end