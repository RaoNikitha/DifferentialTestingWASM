;; 9. Create an `if-else` structure where one path contains an `unreachable` followed by an instruction like `i64.add`. Ensure this test verifies type constraints in conditional structures.

(assert_invalid
  (module (func (result i64) 
    (if (i32.const 1) 
        (then (unreachable))
        (else (i64.add (i64.const 1) (i64.const 2)))
    )
  ))
  "type mismatch"
)