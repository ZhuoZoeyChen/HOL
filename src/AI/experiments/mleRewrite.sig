signature mleRewrite =
sig

  include Abbrev

  type pos = int list
  type pb = (term * pos)
  datatype board = Board of pb | FailBoard
  datatype move = Arg of int | Paramod of (int * bool)

  val mk_startsit : term -> board psMCTS.sit
  val gamespec : (board,move) mlReinforce.gamespec

  (* proof length *)
  val lo_trace : int -> term -> ((term * pos) list * int) option
  val lo_prooflength : int -> term -> int

  (* statistics *)
  val maxprooflength_atgen : unit -> int list
  val stats_prooflength : string -> (int * int) list

  (* exploration *)
  val explore_gamespec : term -> unit
  val reinforce_fixed : string ->  int ->
    (term * real list * real list) list * mlTreeNeuralNetwork.dhtnn
  val final_eval : string -> int * int -> string -> int

end