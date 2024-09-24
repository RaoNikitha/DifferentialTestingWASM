;; 9. **Simultaneous Function and Memory Operations in Conditional Flow**:    Inside an `if` block, perform function calls modifying memory and return values used outside `if`. Validate function return values impacting flow after conditional evaluation.

(assert_invalid
  (module (func $simult-func-mem (result i32)
    (local $tmp i32)
    (if (result i32) (i32.const 1)
      (then 
        (local.set $tmp (call $someFunc))
        (i32.store (i32.const 0) (local.get $tmp))
        (local.get $tmp)
      )
      (else 
        (memory.grow (i32.const 1))
        (i32.const 0)
      )
    )
  ))
  "stack type mismatch"
)