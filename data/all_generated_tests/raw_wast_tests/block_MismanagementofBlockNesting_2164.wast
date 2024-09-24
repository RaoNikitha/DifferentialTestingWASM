;; 5. **Test 5**:    Construct a block where the first instruction is another block containing a `br_if` to the outer block. This tests if the branch exits correctly from the nested block to the intended level.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (br_if 1 (i32.const 1))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)