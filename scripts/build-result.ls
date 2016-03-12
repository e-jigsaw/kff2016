require! {
  fs: {write-file-sync}
  path: {resolve}
  jade: {compile-file}
}

result-compiler = compile-file \./src/result.jade
result-html = result-compiler!

result-dest = resolve process.env.npm_package_config_DEST, \./result.html

write-file-sync result-dest, result-html
