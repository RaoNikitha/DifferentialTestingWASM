;; 10. **Function with Multiple Branches and Returns**:     - Construct a function with multiple branching paths via `br_if`, each returning on different conditions. Validate if any path incorrectly evaluates conditions causing incorrect returns due to stack mishandling.

(assert_invalid
  (module
    (func $multi_branches (param i32) (result i32)
      (block $outer
        (block $inner
          (local.get 0)
          (i32.const 1)
          (i32.add)
          (br_if $inner)
          (br $outer)
        )
        (return (i32.const 0))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)