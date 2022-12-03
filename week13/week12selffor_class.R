breaks = {
  df$year |> range() -> xrange
  seq(xrange[[1]], xrange[[2]]) %% 5 == 0 -> pick
  seq(xrange[[1]], xrange[[2]])[pick] -> breakMiddle
  c(xrang, breakMiddle) |> sort()
}


