;; 5. **Test Description**:    Create a structure where several layers of nested `block` and `loop` instructions involve `br_table` operations that should selectively exit multiple enclosing blocks. This test ensures that the target indices and corresponding blocks are correctly assessed in both contexts.

(assert_invalid
  (module (func $multiple-nested-blocks (result i32)
    (block $outer (result i32)
      (block $middle (result i32)
        (block $inner (result i32)
          (br_table 0 1 2 (i32.const 0))
          (i32.const 1)
        )
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)