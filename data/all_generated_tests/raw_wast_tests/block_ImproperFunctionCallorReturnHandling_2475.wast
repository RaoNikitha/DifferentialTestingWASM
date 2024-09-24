;; 6. **Test 6**: Create a block calling a function with a parameter signature that requires a certain stack state, but manipulate the stack inside the block first, forcing the implementations to handle potential mismatches.

(assert_invalid
  (module
    (func $test
      (i32.const 0)
      (block (param i32) (call $dummy (i32.const 42)))
    )
    (func $dummy (param i32))
  )
  "type mismatch"
)