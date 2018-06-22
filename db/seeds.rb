User.delete_all
Photo.delete_all

louis = User.create(username: "louis_raymond", password:"1")
jigar = User.create(username: "jig_r", password:"1")
steven = User.create(username: "stevenuniverse", password:"1")
rishi = User.create(username: "im-rish-bish", password:"1")
hanna = User.create(username: "hannamontana", password:"1")

steven.post_via_url("https://files.slack.com/files-pri/T02MD9XTF-FBDAYV8TZ/image.png")

louis.post_via_url("https://78.media.tumblr.com/ff290309d2bae515a6823a623845b0a3/tumblr_p7pdem5rH51s8p8nfo1_1280.png")
louis.post_via_url("https://i.ytimg.com/vi/v5QfXIqbyXg/hqdefault.jpg")
louis.post_via_url("https://images.ctfassets.net/o59xlnp87tr5/nywabPmH5Y6W4geG8IYuk/0a59905671f8d637350df8e7ec9e7fb9/backgrounds-min.jpg")

jigar.post_via_url("https://pixel.nymag.com/imgs/daily/vulture/2018/06/05/6-Cudi.nocrop.w710.h2147483647.png")
jigar.post_via_url("https://i.ytimg.com/vi/v5QfXIqbyXg/hqdefault.jpg")
jigar.post_via_url("https://cdn1.thr.com/sites/default/files/2016/02/kanye_west_yeezy_season_3.jpg")

hanna.post_via_url("http://wpuploads.appadvice.com/wp-content/uploads/2015/08/2015-08-13-1.34.57.png")
hanna.post_via_url("https://i.ytimg.com/vi/v5QfXIqbyXg/hqdefault.jpg")
hanna.post_via_url("https://images.ctfassets.net/o59xlnp87tr5/nywabPmH5Y6W4geG8IYuk/0a59905671f8d637350df8e7ec9e7fb9/backgrounds-min.jpg")

rishi.post_via_url("https://pixel.nymag.com/imgs/daily/vulture/2018/06/05/6-Cudi.nocrop.w710.h2147483647.png")
rishi.post_via_url("https://i.ytimg.com/vi/v5QfXIqbyXg/hqdefault.jpg")
rishi.post_via_url("https://cdn1.thr.com/sites/default/files/2016/02/kanye_west_yeezy_season_3.jpg")




jigar.follow(louis)
jigar.follow(steven)
louis.follow(steven)
hanna.follow(rishi)
rishi.follow(louis)
hanna.follow(louis)
