open Tsdl

type t 

val init: Sdl.renderer -> t
val draw: t -> Sdl.renderer -> unit