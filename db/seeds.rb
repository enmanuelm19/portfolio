User.create(email:'admin@admin.com', password: 'password', password_confirmation: 'password')
Post.create(title: 'Title', content: 'Content', user_id: User.last.id)
