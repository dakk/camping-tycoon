type t = {
  windows: Window.t list
};;

let init () = {
  windows= []
};;

let add_window ui w = { windows=ui.windows @ [w] };;

let create_window () = Window.create ();;

let draw ui r = 
  let rec dstep wl = match wl with 
  | [] -> ()
  | w::wl' -> Window.draw w r; dstep wl'
  in dstep ui.windows
;;