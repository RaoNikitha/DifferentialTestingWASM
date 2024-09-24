;; 10. Design a block that expects an `f32` value but uses a `select` instruction inside the block that resolves to an `i32` type. This checks the handling of type mismatches within selective control flow instructions within blocks.

(assert_invalid
  (module
    (func $type-select-conflict
      (block (result f32)
        (select (i32.const 1) (i32.const 2) (i32.const 0))
      )
    )
  )
  "type mismatch"
)