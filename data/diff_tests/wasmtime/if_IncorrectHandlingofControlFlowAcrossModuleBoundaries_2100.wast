;; 1. A test where an `if` instruction within a function calls an imported function inside the `then` block, and the imported function alters the stack state in a way that would cause stack misalignment when returning to the calling module.

(assert_invalid
 (module
  (import "env" "alter_stack" (func $alter_stack (result i32)))
  (func $test_func
   (if (result i32) (i32.const 1)
    (then (call $alter_stack))
    (else (i32.const 0))
   )
   (drop)
  )
 )
 "type mismatch"
)