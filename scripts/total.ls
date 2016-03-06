require! {
  fs: {read-file-sync}
}

read-file-sync \./source.tsv
  .to-string!
  .split \\r\n
  .slice 0, -1
  .map (.split \\t)
  .reduce do
    (prev, row)->
      if prev[row.1] is undefined then prev[row.1] = 0
      if prev[row.2] is undefined then prev[row.2] = 0
      prev[row.1] += 3
      prev[row.2] += 2
      prev
    {}
  |> (res)->
    Object
      .keys res
      .map (key)-> "#{key}\t#{res[key]}"
      .join \\n
  |> console.log
