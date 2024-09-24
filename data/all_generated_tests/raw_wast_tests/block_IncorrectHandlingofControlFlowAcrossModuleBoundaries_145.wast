;; 6. **Test Description**: Design a `block` that invokes a deeply nested imported function, containing a control flow sequence with mismatched return stack types.    **Constraint**: Test proper propagation and handling of control flow in nested scenarios when transitioning between modules.

(assert_invalid
  (module
    (import "env" "func" (func $imported-func1 (result i32)))
    (func $type-nested-import (result i32)
      (block (result i32)
        (block (result i64)
          (call $imported-func1) 
          (br 1)
        )
        (br 0) 
      )
    )
  )
  "type mismatch"
)