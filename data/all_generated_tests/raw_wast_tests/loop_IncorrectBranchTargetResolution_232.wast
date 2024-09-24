;; 3. Implement a `loop` instruction containing a `br_table` that branches conditionally to multiple nested blocks. Verify correct target resolution for different inputs.

(assert_invalid
  (module
    (func $differential_br_table (param i32) (result i32)
      (local $l i32)
      (loop (param i32) (result i32)
        (block $block1 (i32.const 1))
        (block $block2 (i32.const 2))
        (block $block3 (i32.const 3))
        (br_table $block1 $block2 $block3 (local.get 0))
        (local.get $l)
      )
    )
  )
  "type mismatch"
)