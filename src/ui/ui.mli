open Tsdl

type t

val init: unit -> t
val add_window: t -> Window.t -> t
val create_window: unit -> Window.t
val draw: t -> Sdl.renderer -> unit