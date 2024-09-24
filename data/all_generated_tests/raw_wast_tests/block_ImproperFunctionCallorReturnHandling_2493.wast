;; A `block` instruction encapsulates multiple sequential function calls and returns, some of which involve nested `block` instructions. This tests if the engines maintain proper function call sequences and return values as structured in deeply nested contexts.

(assert_invalid
  (module
    (func $block-test
      (block (result i32)
        (i32.const 1)
        (block (result i32) 
          (i32.const 2)
          (block (result f32) 
            (f32.const 1.0)
            (br 2)
          )
          (br 0)
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)