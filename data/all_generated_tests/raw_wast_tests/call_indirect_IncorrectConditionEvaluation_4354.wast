;; 3. **Test Description**: Define a function that returns non-zero when called indirectly, followed by a `br_if` that tests for non-zero return value to branch conditionally.      **Specific Constraint**: Accurate handling and returning of result values to the stack.      **Incorrect Condition Evaluation**: Confirm if `br_if` genuinely detects non-zero outcome or falsely branches.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $return-nonzero (result i32) (i32.const 42))
    (elem (i32.const 0) $return-nonzero)
    (table 1 funcref)
    (func $test
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
      (br_if 0)
    )
  )
  "type mismatch"
)