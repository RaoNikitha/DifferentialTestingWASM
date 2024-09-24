;; 1. **Test 1**: Create a nested block with a `call` instruction inside the deepest nested level. Ensure the function being called returns multiple values requiring popping arguments and pushing results. This tests if the placement of result types is mismanaged within nested contexts in different engines.

(assert_invalid
  (module
    (func $nested-block-with-multi-result
      (block
        (block
          (block
            (call 1)
          )
        )
      )
    )
    (func (result i32 i32)
      (i32.const 1)
      (i32.const 2)
    )
  )
  "type mismatch"
)