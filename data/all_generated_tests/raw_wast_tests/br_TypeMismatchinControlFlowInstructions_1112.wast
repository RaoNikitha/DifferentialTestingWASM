;; 3. **Test Description:**    - Establish an `if` block that expects an `i32` on both the true and false branches.    - Use a `br` instruction within the false branch to exit the block, only having pushed an `f32` on the stack.    - This verifies the correct type enforcement when branching out of `if` conditions.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (then (i32.const 1))
          (else (f32.const 0.0) (br 0))
        )
      )
      (drop)
    )
  )
  "type mismatch"
)