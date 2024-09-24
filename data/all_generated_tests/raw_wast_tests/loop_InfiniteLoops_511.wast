;; 2. Create a `loop` containing a `br_if` instruction with a condition that always evaluates to true. Check if incorrect condition evaluation allows `WebAssembly` to exit properly while `wizard_engine` gets stuck in an infinite loop.

(assert_invalid
 (module 
  (func $test-loop-with-br_if
   (i32.const 1) 
   (loop (result i32) 
    (br_if 0 (i32.const 1)) 
   )
  )
 )
 "type mismatch"
)