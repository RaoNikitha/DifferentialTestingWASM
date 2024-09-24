;; 8. **Test Description**: Combine `nop` instructions within complex branching, where branches are heavily dependent on the stack's state. Ensure that each branch outcomes remain predictable, confirming the stack is not corrupted by `nop`.

(assert_invalid
  (module
    (func (result i32)
      (block
        (i32.const 10)
        (i32.const 20)
        (if (result i32)
          (then
            (nop)
            (i32.add)
          )
          (else
            (nop)
            (i32.mul)
          )
        )
      )
    )
  )
  "type mismatch"
)