;; 6. Construct a `loop` containing multiple consecutive `if` and `else` branches manipulating the operand stack with different depths. Ensure that each conditional branch does not cause operand misalignment on stack re-entry.

(assert_invalid
  (module (func (result i32)
    (local i32)
    (loop (result i32)
      (if (result i32)
        (if (result i32)
          (then (i32.const 1))
          (else (i32.const 2))
        )
        (then (i32.const 3))
        (else (i32.const 4))
      )
    )
  ))
  "type mismatch"
)