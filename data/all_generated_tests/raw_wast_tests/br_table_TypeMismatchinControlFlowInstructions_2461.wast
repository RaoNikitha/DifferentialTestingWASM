;; 1. **Test Description**: Create a block with a result type of `i32` but include a `br_table` instruction inside that branches to labels expecting a result type of `f32`.

(assert_invalid
  (module (func $mismatch-result-type
    (block (result i32)
      (br_table 0 1 (i32.const 0) (i32.const 1))
      (block (result f32) (i32.const 0))
    )
  ))
  "type mismatch"
)