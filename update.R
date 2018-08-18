require(rtweet)
require(digest)
require(tidyverse)

hadley_follower_ids = get_followers('hadleywickham', n=75000, retryonratelimit = T)

hadley_followers = lookup_users(as_userid(hadley_follower_ids$user_id))

handles = tolower(hadley_followers$screen_name)

hashed = data_frame(hash = sapply(handles, sha1))

write_csv(hashed, 'hadley_followers.csv')
