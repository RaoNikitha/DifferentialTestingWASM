;; Write a function with a `br_if` conditional jump inside a loop and place an `unreachable` instruction at the end of the loop. Ensure this jump's condition always evaluates correctly, and only incorrect evaluations cause a trap.

(assert_invalid
  (module (func $unreachable_in_loop_with_br_if
    (loop
      (i32.const 1)
      (br_if 0)
      (unreachable)
    )
  ))
  "type mismatch"
)