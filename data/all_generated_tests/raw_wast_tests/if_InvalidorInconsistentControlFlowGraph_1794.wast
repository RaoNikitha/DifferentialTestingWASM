;; 5. Layout a scenario where an `if` instruction contains the `unreachable` opcode within the `then` block, yet the `else` block tries to perform stack operations that are invalid following an unreachable code segment.

(assert_invalid
  (module (func $unreachable-then-invalid-else
    (if (i32.const 0)
      (then (unreachable) (i32.const 1))
      (else (i32.const 1) (f32.const 2.0))
    )
  ))
  "type mismatch"
)