;; 1. Test an infinite loop where `unreachable` is placed inside a `loop` block that is terminated by a `br_if` instruction conditioned on a constant false value. This tests whether both implementations consistently trap despite the indefinite repetition.

(assert_invalid
  (module
    (func $infinite-unreachable-loop
      (block (loop
        (unreachable) (br_if 0 (i32.const 0))
      ))
    )
  )
  "unreachable executed causing a trap"
)