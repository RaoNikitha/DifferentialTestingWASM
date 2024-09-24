;; 8. **Test Description**: Test an `if` block conditionally setting the value of a local variable based on its condition. The test checks if the local variable retains its correct value, depending on whether the `if` condition is true or false.

(assert_invalid
  (module (func $type-local-variable-condition (local $var i32)
    (i32.const 1)
    (if (result i32) 
      (i32.const 1)
      (then (i32.const 2) (local.set $var))
      (else (i32.const 3) (local.set $var))
    )
    (local.get $var)
  ))
  "type mismatch"
)