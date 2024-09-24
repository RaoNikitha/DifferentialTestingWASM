;; 4. **Branch Condition Comparing Local Variables**:    - Define local variables and use `br_if` to branch based on a comparison between them (e.g., if `local.get 0` is equal to `local.get 1`). Ensure the branch does not occur when variables are different, testing correct condition checking.

(assert_invalid
  (module
    (func (param i32 i32)
      (block (result i32)
        (local.get 0)
        (local.get 1)
        (i32.eq)
        (br_if 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)