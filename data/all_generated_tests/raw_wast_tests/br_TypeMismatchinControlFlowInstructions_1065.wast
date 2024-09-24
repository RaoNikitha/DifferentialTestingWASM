;; 6. **Test for Type Constraint Violation in Structured Control:**    Place a block expecting an `i32` result inside an `if` condition branch and use `br` to exit the `if` block with a floating-point value. This verifies the enforcement of result type constraints in structured control flow.

(assert_invalid
  (module (func $type-constraint-violation-in-structured-control (result i32)
    (if (i32.const 1)
      (then (block (result i32) (br 0 (f32.const 1.0))))
    )
  ))
  "type mismatch"
)