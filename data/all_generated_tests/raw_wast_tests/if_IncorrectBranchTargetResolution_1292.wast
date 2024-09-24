;; 3. **Test for Incorrect Intermediate `block` Jump**:    Create an `if-else` block nested within another block. Use a `br` instruction inside the `if` that targets the outer block, ensure the branch correctly skips over intervening code.    - **Constraint**: Validate correct handling and resolution of branch targets after the nested block.    - **Expectation**: `br` should jump to the end of the outermost block, bypassing the nested structures.

(assert_invalid
  (module
    (func $invalid_br_target
      (block
        (i32.const 1)
        (if (result i32)
          (i32.const 0)
          (then (br 1))
          (else (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)