open Tsdl

type t

val create: unit -> t
val draw: t -> Sdl.renderer -> unit