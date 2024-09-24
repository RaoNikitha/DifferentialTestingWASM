;; 5. Mixed Type Manipulations: Test a scenario where the `then` and `else` branches manipulate different types on the stack. ```wasm // Example (if (result f32)   (then f32.const 1.5)   (else i32.const 7) ) ``` *Reasoning*: This ensures consistent stack type handling, as improper management may lead to stack corruption.

(assert_invalid
  (module (func $mixed-type-manipulations 
    (i32.const 0)
    (if (result f32) 
       (then f32.const 1.5) 
       (else i32.const 7
     ) 
  ))
  "type mismatch"
)