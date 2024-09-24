;; 2. **Multiple Conditional Branches in Loop**    - Code a loop containing multiple `br_if` instructions with varying conditions, some of which always evaluate to `false`. Test to verify only the correct branches are taken.    - **Reason**: Verifies that `br_if` conditions are correctly evaluated in a complex loop structure and invalid conditions do not lead to branching.

(assert_invalid
  (module (func $multiple-conditional-branches-in-loop
    (loop (result i32)
      i32.const 42
      i32.const 0
      br_if 0
      i32.const 24
      i32.const 1
      br_if 0
      drop
      i32.const 10
    )
    (unreachable)
  ))
  "type mismatch"
)