if(!require(digest)){ install.packages('digest'); Sys.sleep(1); require(digest) }

hadley_index = function(x, pc = F){
  x = tolower(gsub('@', '', trimws(x)))             # clean handles
  i = match(sapply(x, sha1), hadley_followers$hash) # latest first index
  I = nrow(hadley_followers) - i                    # earliest first index
  if(pc) 100 * I/nrow(hadley_followers) else I      # index or percent
}

if('hadley_followers.csv' %in% list.files()){
  hadley_followers = read.csv('hadley_followers.csv', stringsAsFactors=F)
} else hadley_followers = read.csv('https://github.com/geotheory/hadley_index/hadley_followers.csv', stringsAsFactors=F)
