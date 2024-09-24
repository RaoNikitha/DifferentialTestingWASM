;; 2. A nested block structure where the outer block expects an `i32` result, but the inner block has a `br` that tries to break with an `f32` value. This tests type consistency across nested blocks.

(assert_invalid
  (module
    (func $type-mismatch-inner-br
      (result i32)
      (block (result i32)
        (block
          (br 1 (f32.const 1.0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)