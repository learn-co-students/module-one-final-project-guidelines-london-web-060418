User.delete_all
Photo.delete_all

louis = User.create(username: "louis_raymond", password:"1")
jigar = User.create(username: "jig_r", password:"1")
steven = User.create(username: "stevenuniverse", password:"1")
rishi = User.create(username: "ri-shitown", password:"1")
hanna = User.create(username: "hannamontana", password:"1")


louis.post_via_url("http://wpuploads.appadvice.com/wp-content/uploads/2015/08/2015-08-13-1.34.57.png")
louis.post_via_url("https://i.pinimg.com/originals/94/dd/57/94dd573e4b4de604ea7f33548da99fd6.jpg")
louis.post_via_url("https://images.ctfassets.net/o59xlnp87tr5/nywabPmH5Y6W4geG8IYuk/0a59905671f8d637350df8e7ec9e7fb9/backgrounds-min.jpg")


hanna.post_via_url("http://wpuploads.appadvice.com/wp-content/uploads/2015/08/2015-08-13-1.34.57.png")
hanna.post_via_url("https://i.pinimg.com/originals/94/dd/57/94dd573e4b4de604ea7f33548da99fd6.jpg")
hanna.post_via_url("https://images.ctfassets.net/o59xlnp87tr5/nywabPmH5Y6W4geG8IYuk/0a59905671f8d637350df8e7ec9e7fb9/backgrounds-min.jpg")


jigar.follow(louis)
jigar.follow(steven)
louis.follow(steven)
hanna.follow(rishi)
rishi.follow(louis)
hanna.follow(louis)
