open Tsdl

type t

val init : unit -> t
val step : t -> Sdl.renderer -> t
val is_running : t -> bool