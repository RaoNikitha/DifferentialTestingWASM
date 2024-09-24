;; Test 9: Construct a test where a function has nested blocks, each containing local variable manipulations with different types. Inside the deepest block, place a `return` instruction and verify correct unwinding and restoring of variable states and types.

(assert_invalid
  (module
    (func $nested-blocks-with-return (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (local i32)
            (local.set 0 (i32.const 1))
            (return (i32.const 42))
          )
          (local.get 0)
        )
        (local.get 0)
      )
    )
  )
  "type mismatch"
)