open Tsdl

type t 

val init: unit -> t
val draw: t -> Sdl.renderer -> unit