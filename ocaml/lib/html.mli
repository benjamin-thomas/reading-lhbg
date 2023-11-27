type html
type structure

val append_ : structure -> structure -> structure
val render : html -> string
val h1_ : string -> structure
val p_ : string -> structure
val code_ : string -> structure
val ol_ : structure list -> structure
val ul_ : structure list -> structure
val html_ : title:string -> structure -> html
