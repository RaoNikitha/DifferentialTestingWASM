;; 6. **Block with Multiple Conditions**:    - Create a `block` with multiple `br_if` statements each controlled by different conditions (some true, some false). Ensure only the true conditions cause branching, checking if each condition is individually and correctly evaluated.

(assert_invalid
  (module
    (func $block-with-multiple-conditions
      (block (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 1)) 
        (br_if 1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)