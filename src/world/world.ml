open Tsdl;;
open Tsdl_image;;

type t = {
  res: (string, Tsdl.Sdl.texture) Hashtbl.t;
};;

let get_res wrl k = Hashtbl.find wrl.res k;;


let init r = 
  let res = Hashtbl.create 16 in
  let Result.Ok sbeach = Image.load_texture r "res/tiles/ts_beach0/straight/45/0.png" in
  Hashtbl.add res "t_beach0" sbeach;
  let Result.Ok sgrass0 = Image.load_texture r "res/tiles/ts_grass0/straight/45/0.png" in
  Hashtbl.add res "t_grass0" sgrass0;
  let Result.Ok sgrass1 = Image.load_texture r "res/tiles/ts_grass1/straight/45/0.png" in
  Hashtbl.add res "t_grass1" sgrass1;

  { res= res }
;;

let draw wrl r =
  for i = 0 to 32 do
    for j = 0 to 32 do
      let imrect = Sdl.Rect.create ~x:(i * 64 + (if j mod 2 = 0 then 0 else 32)) ~y:(j * 32 - (if j mod 2 = 0 then 16 else 0)) ~w:64 ~h:64 in
      Sdl.render_copy r (get_res wrl "t_grass1") ~dst:imrect |> ignore;
    done
  done;;
  ()
;;