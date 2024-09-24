;; 4. **Branch with Different Types for Conditional If Block:**    - Define an `if` instruction returning an `i32` and branch out of the true block using `br`. Test differing types for the `else` branch like `f32`. This validates type enforcement across `if` branches in different conditions.

(assert_invalid
  (module
    (func $branch_different_types_if
      (block
        (i32.const 1)
        (if (result i32)
          (then (br 0 (i32.const 1)))
          (else (f32.const 1.0))
        )
      )
      (drop)
    )
  )
  "type mismatch"
)