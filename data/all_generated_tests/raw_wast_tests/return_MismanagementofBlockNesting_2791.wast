;; Test 10: Create a function with nested blocks and place multiple `return` instructions at varying depths based on different conditional checks. Ensure that executing any `return` unwinds all nested blocks and restores the appropriate outer block's stack state.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (block
        (block
          (if (i32.const 1)
            (then (return (i32.const 42)))
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)