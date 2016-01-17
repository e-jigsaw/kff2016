require! {
  fs: {write-file-sync}
  path: {resolve}
  \@jigsaw/lson : {parse-file}
  jade: {compile-file}
}

data = parse-file \./src/data.lson
compiler = compile-file \./src/index.jade

years =
  Object
    .keys data
    .reverse!

html =
  compiler do
    years: years
    data: data

dest = resolve process.env.npm_package_config_DEST, \./index.html

write-file-sync dest, html
