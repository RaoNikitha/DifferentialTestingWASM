;; 1. Test branching directly before and after an imported function call, ensuring the control entry and value stack are handled correctly through the boundary.

(assert_invalid
  (module
    (import "env" "func" (func $imported))
    (func $test (result i32)
      (block (result i32)
        (call $imported)
        (br 0)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)