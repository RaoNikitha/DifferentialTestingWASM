;; 1. **Test 1**: Execute a `block` that contains a `call` instruction targeting a function with mismatched parameter types. This will check how the implementations handle stack type consistency and whether they can correctly pass parameters from the block to the function.

(assert_invalid
  (module 
    (func $mismatched-params (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 10))
    )
    (func (result i32)
      (block (result i32)
        (call $mismatched-params (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)