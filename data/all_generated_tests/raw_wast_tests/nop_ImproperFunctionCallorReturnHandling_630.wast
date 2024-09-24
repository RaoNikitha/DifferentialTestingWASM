;; 1. Create a function that starts with a `nop` instruction followed by a `call` to another function. Ensure that this called function performs a simple arithmetic operation. Verify that the result is correct, ensuring that the `nop` does not affect the function call sequence.

 ;; (module 
  (func $arithmetic (result i32) 
    (i32.add (i32.const 1) (i32.const 2)))
  (func (result i32) 
    (nop) 
    (call $arithmetic)) 
  (export "test" (func 1))
)