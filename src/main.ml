open Tsdl;;

let log_err fmt = Format.eprintf (fmt ^^ "@.")
let log fmt = Format.printf (fmt ^^ "@.")


let rec loop r game = match Game.is_running game with
| false -> ()
| true ->
	Sdl.delay @@ Int32.of_int 50;
	loop r @@ Game.step game r
;;


let main () = 
	let wprops = Sdl.Window.opengl in
	match Sdl.create_window "Camping Tycoon" ~w:800 ~h:600 wprops with
	| Error (`Msg e) -> log_err "Could not create window: %s" e; ()
	| Ok w -> (
		let game = Game.init () in
		log "Started."; 
		match Sdl.create_renderer w with 
		| Error _ -> ()
		| Ok r -> 
			loop r game;
			log "Exiting."; 
			Sdl.destroy_window w;
			()
	)
;;

main ();;