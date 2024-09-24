;; 9. Design a loop with a combination of `block`, `loop`, and `call` instructions, where `br` targets the loop from within the called function. Verify if the branch correctly resolves to the loop label after returning from the function call, testing label context preservation across function boundaries.

(assert_invalid
  (module 
    (func $callee (result i32) 
      (br 0) 
      (i32.const 0)
    ) 
    (func $caller (result i32)
      (loop (result i32)
        (call $callee)
      )
    )
  )
  "type mismatch"
)