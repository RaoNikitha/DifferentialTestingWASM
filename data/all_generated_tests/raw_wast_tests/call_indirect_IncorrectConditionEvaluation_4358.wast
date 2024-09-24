;; 7. **Test Description**: Use `call_indirect` within a nested block structure, followed by conditional `br_if` to evaluate if the nesting affects the correctness of condition checking.      **Specific Constraint**: Proper nesting and handling of operand context within nested blocks.      **Incorrect Condition Evaluation**: Examine if `br_if` misinterprets conditions within nested contexts.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $nested-func)
    (func $nested-func (param i32) (result i32)
      (local.get 0)
    )
    (func $test-func (param i32) (result i32)
      (block
        (block
          (local.get 0)
          (call_indirect (type 0) (i32.const 0))
          (br_if 1 (i32.const 1))
        )
        (local.get 0)
      )
    )
  )
  "type mismatch"
)