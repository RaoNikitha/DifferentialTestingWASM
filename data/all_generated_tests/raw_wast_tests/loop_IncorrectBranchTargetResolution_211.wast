;; 2. **Test Input: Forward Branch within Nested `loop` and `block`**    - Description: Test a `br` instruction inside a nested `loop` within a `block` that should target the outer `block` but targets the inner `loop`.    - Constraint: Ensure nested constructs’ labels do not interfere with each other.    - Focus: Validate handling of label indices to confirm that `br` distinguishes between loop and block labels.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)