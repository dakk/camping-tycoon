open Tsdl;;

type t = {
  x: int;
  y: int;
  width: int;
  height: int;
  title: string
};;

let create () = {
  x= 10;
  y= 10;
  width= 350;
  height= 200;
  title= "Undefined title"
};;

let draw w r = 
  (* Draw the rect *)
  let vp = Sdl.Rect.create ~x:w.x ~y:w.y ~w:w.width ~h:w.height in
  Sdl.set_render_draw_color r 0x55 0x55 0x55 0xFF |> ignore;
  Sdl.render_fill_rect r (Some vp) |> ignore;

  (* Draw the title rect *)
  let vptitle = Sdl.Rect.create ~x:(w.x + 3) ~y:(w.y + 3) ~w:(w.width - 6 - 16) ~h:16 in
  Sdl.set_render_draw_color r 0x33 0x33 0x33 0xFF |> ignore;
  Sdl.render_fill_rect r (Some vptitle) |> ignore;

  Sdl.set_render_draw_color r 0x99 0x99 0x99 0xFF |> ignore;
  Sdl.render_draw_line r (w.x + 3) (w.y + 3 + 16) (w.x + w.width - 3) (w.y + 3 + 16) |> ignore;

  (* Draw the title *)
  ()
;;