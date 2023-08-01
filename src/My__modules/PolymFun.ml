type t = { func : 'a. typ:'a Type.t -> 'a -> 'a }

let apply ~f ~typ t = f.func ~typ t

let redefine_at_typ : type a. typ:a Type.t -> f_at_typ:(a -> a) -> f_elsewhere:t -> t =
  fun ~typ:target_typ ~f_at_typ ~f_elsewhere ->
  let func : type b. typ:b Type.t -> b -> b =
    fun ~typ x ->
    match Type.same_witness typ target_typ with
    | Some T -> f_at_typ x
    | None -> apply ~f:f_elsewhere ~typ x
  in
  { func }
;;
