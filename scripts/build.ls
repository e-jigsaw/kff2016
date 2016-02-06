require! {
  fs: {write-file-sync}
  path: {resolve}
  \@jigsaw/lson : {parse-file}
  jade: {compile-file}
}

data = parse-file \./src/data.lson
index-compiler = compile-file \./src/index.jade
yearly-compiler = compile-file \./src/yearly.jade

years =
  Object
    .keys data

index-html =
  index-compiler do
    years: years
    data: data

index-dest = resolve process.env.npm_package_config_DEST, \./index.html

write-file-sync index-dest, index-html

year <- years.for-each

yearly-html =
  yearly-compiler do
    year: year
    data: data[year]

yearly-dest = resolve process.env.npm_package_config_DEST, "#{year}.html"

write-file-sync yearly-dest, yearly-html
