fnames = %w[Taro Jiro Hana Jhon Mike]
gnames = %w[Yamada Tanaka Suzuki Smith]

(0..4).each do |num|
  user = User.create(name: "#{fnames[num % 5]}#{gnames[num % 4]}", email: "#{fnames[num % 5]}@ta.com", password: "#{fnames[num % 5]}1234")
  
  (1..5).each do |int|
    task = user.tasks.build(content: "#{fnames[num]}#{int}", status: 'running!')
    task.save
  end
end
