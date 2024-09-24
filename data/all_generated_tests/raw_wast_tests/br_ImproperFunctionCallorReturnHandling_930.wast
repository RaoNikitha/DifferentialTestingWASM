;; <Test 1> Create a WebAssembly module with deeply nested `block` and `loop` structures. Within these structures, place a `call` instruction that calls a function returning multiple values. Follow this with a `br` instruction to a label within the nested context. Check if the return values are properly handled after the branching.

(assert_invalid
  (module
    (func $nested-br (param i32) (result i32)
      (block $outer
        (block $inner
          (loop $loop
            (call $return-multiple) ; Call a function returning multiple values
            (br $inner) ; Branch to inner block
          )
        )
      )
    )
    (func $return-multiple (result i32 i32)
      (i32.const 42) (i32.const 43)
    )
  )
  "type mismatch"
)