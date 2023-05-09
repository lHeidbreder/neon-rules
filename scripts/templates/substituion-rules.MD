* read a _key_ from the table -> all _keys_ have to match "^(itemize:)?[a-zA-Z_]+$"
* if it fits "@itemize:[a-zA-Z_]@", split the value at every newline, add "\item " to the front and concatenate again
* replace "@" + _key_ + "@" with the value