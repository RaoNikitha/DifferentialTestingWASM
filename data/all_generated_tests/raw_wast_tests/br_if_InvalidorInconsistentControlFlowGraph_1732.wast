;; 3. **Test 3**:    - **Description**: An `if` block with a `br_if` instruction inside, conditionally breaking out to an enclosing block when a stack operand is non-zero.    - **Constraint**: Checking correct conditional branch behavior within an `if` block.    - **CFG Relation**: Ensures CFG correctly models branches within conditional structures.

(assert_invalid
  (module
    (func
      (block $outer
        (if (i32.const 1)
          (then
            (br_if 1 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)