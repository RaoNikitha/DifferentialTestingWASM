;; 10. **Test 10**:     - Verify a function indirectly called within another function, containing nested loops where the inner loop exit condition (`br_if`) is misconfigured, thereby causing the outer loop to behave incorrectly and result in infinite looping.     - **Constraint Checked**: Tests the nested loop context and verifies that misconfigured inner loop exits do not propagate improper behavior leading to indefinite outer looping.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $test (result i32)
      (loop $outer
        (block $inner
          (call_indirect (type $sig) (i32.const 0) (i32.const 0))
          (br_if $inner (i32.const 1))
          (br_if $outer (i32.const 0))
        )
      )
    )
    (table 1 funcref)
  )
  "type mismatch"
)