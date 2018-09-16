open Tsdl;;

type t = {
  x: int;
  y: int;
  width: int;
  height: int;
};;

let create () = {
  x= 10;
  y= 10;
  width= 350;
  height= 200
};;

let draw w r = 
  let vp = Sdl.Rect.create ~x:w.x ~y:w.y ~w:w.width ~h:w.height in
  Sdl.set_render_draw_color r 0x55 0x55 0x55 0xFF |> ignore;
  Sdl.render_fill_rect r (Some vp) |> ignore;
  ()
;;