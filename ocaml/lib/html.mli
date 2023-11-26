type html
type structure

val append_ : structure -> structure -> structure
val render : html -> string
val h1_ : string -> structure
val p_ : string -> structure
val html_ : title:string -> structure -> html
