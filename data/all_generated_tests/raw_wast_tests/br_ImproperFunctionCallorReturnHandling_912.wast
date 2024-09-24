;; 3. Test Description: Implement a recursive function with a nested loop and a `br` instruction within it misconfiguring an operand that impacts the function call return. This tests for proper handling of the operand stack across recursive calls.

(assert_invalid
 (module
  (func $recursive (param i32) (result i32)
   (local.get 0)
   (block 
    (loop 
     (br_if 1 (i32.const 0))
     (call $recursive (local.get 0))
    )
   )
  )
  (export "recursive" (func $recursive))
 )
 "type mismatch"
)