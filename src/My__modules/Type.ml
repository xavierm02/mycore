open! Core
include Type_equal.Id (** @closed *)

let create_from_functor ~functor_name ~arg_names sexp_of_t =
  let name = functor_name ^ "(" ^ String.concat ~sep:", " arg_names ^ ")" in
  create ~name sexp_of_t
;;
