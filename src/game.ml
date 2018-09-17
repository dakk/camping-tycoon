open Tsdl;;

let log fmt = Format.printf (fmt ^^ "@.")

type t = {
  mutable ticks: int;
  mutable ui: Ui.t;
  mutable world: World.t
};;

let is_running g = if g.ticks < 100 then true else false;;

let init r = 
  let g = {
    ticks= 0;
    ui= Ui.init r;
    world= World.init r;
  } in
  (*g.ui <- Ui.add_window g.ui @@ Ui.create_window ();*)
  g
;;

let step g r = 
  log "Step";
  Sdl.set_render_draw_color r 0x00 0x00 0x00 0xFF |> ignore;
  Sdl.render_clear r |> ignore;
  World.draw g.world r;
  Ui.draw g.ui r;
  Sdl.render_present r |> ignore;
  { g with ticks=g.ticks + 1 }
;;
