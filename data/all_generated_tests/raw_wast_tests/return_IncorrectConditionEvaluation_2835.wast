;; 4. Design a series of branches with `br_if` where each branch's condition is computed from different stack values. Track if any incorrect return leads to missed or premature exits from the function.

(assert_invalid
  (module
    (func $type-value-mismatch-br_if-return (result i32)
      (i32.const 1)
      (i32.const 0)
      (br_if 0 (return) (i32.const 1))
    )
  )
  "type mismatch"
)