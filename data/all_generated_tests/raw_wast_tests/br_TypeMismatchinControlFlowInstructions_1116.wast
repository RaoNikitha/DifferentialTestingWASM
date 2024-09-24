;; 7. **Test Description:**    - Construct a `block` with an operand stack setup of `f32, i32`.    - Insert a `br` instruction to branch to a label that expects a single `f32`.    - Ensures that branching checks the stack configuration, focusing on type and stack height mismatches.

(assert_invalid
  (module
    (func $test_block_with_br
      (block (result f32)
        (f32.const 1.0)
        (i32.const 42)  ;; stack has (f32, i32)
        (br 0)
      )
    )
  )
  "type mismatch"
)