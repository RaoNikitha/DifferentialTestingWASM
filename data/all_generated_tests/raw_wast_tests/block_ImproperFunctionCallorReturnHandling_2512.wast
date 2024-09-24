;; Structure a block that calls a function returning a type that doesn't match the outer block's expected result type, followed by an `end` instruction. This will check if the return values are properly managed and pushed back onto the stack correctly.

(assert_invalid
  (module
    (type $t1 (func (result i32)))
    (func $f1 (result i32) (i32.const 42))
    (func (result f32)
      (block (result f32)
        (call $f1)
      )
    )
  )
  "type mismatch"
)