;; 9. Create a complex loop that pushes multiple values onto the stack and calls an imported function which manipulates stack values. Verify that the stack unwinds correctly and maintains integrity across calls.

(assert_invalid 
  (module 
    (import "env" "someFunction" (func $someFunction (param i32 i32) (result i32))) 
    (func (result i32) 
      (i32.const 10) (i32.const 20) 
      (loop (result i32 i32) 
        (call $someFunction) 
        (br_if 0 (i32.const 0)) 
        (call $someFunction) 
      ) 
    ) 
  ) 
  "type mismatch" 
)