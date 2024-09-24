;; 1. **Nested Loop with Incorrect `br` Targeting Outer Loop**:    - **Description**: Test a nested loop where a `br` instruction inside the inner loop incorrectly targets the outer loop instead of the inner one.    - **Constraint**: Ensuring that the label index for `br` correctly refers to the innermost loop.

(assert_invalid
  (module
    (func $nested-loop-br-target (param i32)
      (loop $outer (param i32) (result i32)
        (loop $inner (param i32) (result i32)
          (local.get 0)
          (br 1)  ; incorrect targeting of outer loop
        )
      )
    )
  )
  "type mismatch"
)