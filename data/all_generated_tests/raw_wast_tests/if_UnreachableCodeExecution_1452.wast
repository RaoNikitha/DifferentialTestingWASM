;; 3. **Branch Instantly into Unreachable**:    - A direct branch instruction (such as `br_if`) based on a conditional check should attempt to jump directly to an `unreachable` instruction inside a label block.    - **Constraint**: Tests correct handling of branches into unreachable code paths.

(assert_invalid
  (module
    (func $branch_unreachable
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then
          (br_if 0 (i32.const 1))
          (unreachable)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)