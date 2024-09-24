;; 1. Insert a `nop` instruction immediately after a `call` instruction that pushes values onto the stack, and then follow up with instructions that consume these values to ensure that `nop` does not modify the stack state post-call.

 ;; (module
  (func $test
    (call $dummy)
    nop
    drop
  )
  (func $dummy (result i32) i32.const 1)
)