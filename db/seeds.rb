User.delete_all
Photo.delete_all

louis = User.create(username: "louis_raymond")
jigar = User.create(username: "jig_r")
steven = User.create(username: "stevenuniverse")
rishi = User.create(username: "ri-shitown")
hanna = User.create(username: "hannamontana")


louis.post_via_url("www.placeholder.com")
louis.post_via_url("www.placeholder_2.com")
louis.post_via_url("www.placeholder_3.com")

jigar.follow(louis)
jigar.follow(steven)
louis.follow(steven)
hanna.follow(rishi)
rishi.follow(louis)
hanna.follow(louis)
