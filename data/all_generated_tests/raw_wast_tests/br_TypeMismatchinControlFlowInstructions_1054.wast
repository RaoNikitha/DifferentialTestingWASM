;; 5. **Test 5: Mixed Type Result in Br Encountered in Block**    - Construct a `block` with mixed result types, for example expecting `[i32, f32]`, but a `br` instruction incorrectly provides `[i64, i32]`.    - Verifies correct validation and type checking for multi-type result sequences in blocks.    - Focuses on the operand result type consistency when breaking from blocks.

(assert_invalid
  (module
    (func $mixed-result-br
      (block (result i32 f32)
        (br 0 (i64.const 42) (i32.const 1))
      )
    )
  )
  "type mismatch"
)