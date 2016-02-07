require! {
  fs: {write-file-sync}
  path: {resolve}
  \@jigsaw/lson : {parse-file}
  jade: {compile-file}
}

data = parse-file \./src/data.lson

codes = Object
  .keys data
  .map (year)->
    data[year]
      .programs
      .map (program)-> program.movies.map (movie)-> movie.name
      .reduce do
        (prev, current)-> prev.concat current
        []
  .reduce do
    (prev, current)-> prev.concat current
    []
  .reduce do
    (prev, current)-> prev += "movies.push(\"#{current}\");\n"
    ''

console.log codes
