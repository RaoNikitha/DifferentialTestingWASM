;; A test where an exported function contains an `if` instruction inside which the `else` block performs a return that interacts incorrectly with the calling module. The control flow would test if the return incorrectly unwinds the stack.

(assert_invalid
  (module
    (func $test (result i32)
      (if (result i32)
        (i32.const 0) 
        (then (i32.const 1)) 
        (else (return (i32.const 2)))
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)