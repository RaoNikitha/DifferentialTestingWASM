;; 3. **Test Description:**    - Place an `unreachable` within an `if` block, followed by an `i64` operation in the `else` block. Validate whether type mismatches are correctly detected in conditional control flows.    - **Constraint Checked:** Tests that the type expectations are properly checked across conditional branches.    - **Relation to Type Mismatch:** Verifies consistent type expectation in control flow branches involving `unreachable`.

(assert_invalid
  (module (func $type-if-unreachable-followed-by-i64-op (result i64)
    (if (result i64)
      (i32.const 1)
      (then (unreachable))
      (else (i64.const 1))
    )
  ))
  "type mismatch"
)