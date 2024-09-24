;; - Use a loop with a `br_if` condition that should not take the branch, ensuring the loop iterates. Place the `unreachable` instruction inside the loop body. Validate if `br_if` condition wrongly ends the loop.

(assert_invalid
  (module
    (func $unreachable_in_loop
      (loop (unreachable) (br_if 0 (i32.const 0)))
    )
  )
  "type mismatch"
)