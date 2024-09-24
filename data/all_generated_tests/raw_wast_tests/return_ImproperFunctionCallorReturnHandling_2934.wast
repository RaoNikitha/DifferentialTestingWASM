;; 3. **Function with Mixed Direct and Indirect Calls**:    - Design a function that involves both direct and indirect calls, with some calls leading to an early `return`. This evaluates if the implementations manage the transition from one call type to the other correctly and properly handle `return` operations.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table funcref (elem $f))
    (func $f (result i32) (return))
    (func (result i32)
      (block (result i32)
        (call $f)
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)