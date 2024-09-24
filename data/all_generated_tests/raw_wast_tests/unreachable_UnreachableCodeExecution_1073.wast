;; 4. Use `br_if` to conditionally jump to a `block` containing the `unreachable` instruction, checking if the instruction leads to a trap only when the condition directs the flow to it.

(assert_invalid
  (module (func $conditional-trap
    (block
      (i32.const 1)
      (br_if 0)
      (unreachable)
    )
  ))
  "unreachable executed"
)