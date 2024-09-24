;; 3. **Test Nop Between If-Else**: Implement a function with an `if-else` construct where `nop` instructions are placed between the `if` and `else` branches. This checks if `nop` correctly does nothing and allows the control flow to switch appropriately between branches based on the condition.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then (nop) (i32.const 2))
        (else (nop) (i32.const 3))
      )
    )
  )
  "type mismatch"
)