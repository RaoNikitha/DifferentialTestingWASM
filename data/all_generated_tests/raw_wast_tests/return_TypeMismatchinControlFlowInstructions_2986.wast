;; 5. **Type Conflict in Nested Blocks with Return**: Construct a function with nested blocks where the inner block’s `return` type conflicts with the outer block’s expected type, such as returning `i64` where `f32` is expected. Test if type validation handles this properly.

(assert_invalid
  (module
    (func $type-conflict-in-nested-blocks-with-return (result f32)
      (block
        (block
          (i64.const 0)
          (return)
        )
      )
    )
  )
  "type mismatch"
)