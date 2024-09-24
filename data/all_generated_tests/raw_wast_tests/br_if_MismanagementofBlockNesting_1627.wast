;; 8. **Test 8**: - **Description**: Interleaved `block` and `if` structures with a `br_if` instruction targeting an outer `if` from within a nested block. - **Constraint Checked**: Determine if `br_if` correctly identifies and targets the outer `if` structure.

(assert_invalid
  (module
    (func (block
            (if (then
                  (block (br_if 1 (i32.const 1)))
            ))
    ))
  )
  "unknown label"
)