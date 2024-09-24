;; 2. **Mismatched Block Types in Loop**:    - Create a `loop` with block types inconsistent with the types expected by the context. Use a `br` to jump to the `loop` and check type consistency.    - **Constraint**: Ensure type constraints are validated between entry and exit points of the loop.    - **CFG Check**: The CFG should reflect type mismatches causing inconsistencies in data flow.

(assert_invalid
  (module
    (func $mismatched-block-types
      (i32.const 0)
      (i32.const 1)
      (loop (result i32) (br 0))
    )
  )
  "type mismatch"
)