;; 8. **Test 8: Misaligned Operand Stack in `if` Statement post-`nop`**    - Insert a `nop` right before an `if` statement with an invalid stack type condition.    - **Constraint**: Ensures `nop` leaves the operand stack unchanged before conditional validation.    - **Type Mismatch Check**: Validates stack type synchronization for `if` condition check.

(assert_invalid
  (module 
    (func 
      (nop) 
      (if (i32.const 1) 
        (then)
      )
    )
  )
  "type mismatch"
)