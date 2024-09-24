;; 6. Insert `nop` instructions at the start and end of a function that manipulates the stack with operations like `push` and `pop`, verifying that these `nop` instructions do not lead to stack underflows or overflows across function boundaries.

(assert_invalid
  (module
    (func (local i32)
      nop
      i32.const 1
      drop
      nop
    )
  )
  "type mismatch"
)