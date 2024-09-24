;; 8. **Invalid Forward Branch Operand Type in Conditional Block:**    - Create an `if` block that takes a `f32` branch operand, inserts incorrect type `i64` in the true block, and uses `br` to exit the block. Check if the branch adheres to type constraints.

(assert_invalid
  (module
    (func $invalid-forward-branch-operand-type-in-conditional-block
      (block (result f32)
        (if (result f32)
          (i32.const 1)
          (then
            (i64.const 0)
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)