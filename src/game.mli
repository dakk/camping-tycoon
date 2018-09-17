open Tsdl

type t

val init : Sdl.renderer -> t
val step : t -> Sdl.renderer -> t
val is_running : t -> bool