;; 3. Craft a function with polymorphic handling of stack operands, where the type of stack operands changes during the function execution. Use the `return` instruction to test whether it can properly manage the polymorphic types and avoids any type mismatches leading to stack corruption.

(assert_invalid
 (module
  (func $polymorphic-stack-handling 
   (param $x i32) 
   (result i32)
   (i32.const 10) 
   (if 
    (i32.lt_s (local.get $x) (i32.const 5))
    (then (i32.const 20))
    (else (f32.const 1.5))
   )
   (return)
  )
 )
 "type mismatch"
)