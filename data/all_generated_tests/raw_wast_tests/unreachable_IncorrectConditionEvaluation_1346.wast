;; - Construct a loop where a counter-based `br_if` instruction should prevent exiting the loop and trap only beyond the loop boundary via an `unreachable` instruction. Check for incorrect condition evaluations trapping prematurely.

(assert_invalid
  (module (func $counter_loop_with_unreachable
    (loop (i32.const 10) (block (br_if 1 (i32.eqz (i32.const 0)))) (unreachable))
  ))
  "type mismatch"
)