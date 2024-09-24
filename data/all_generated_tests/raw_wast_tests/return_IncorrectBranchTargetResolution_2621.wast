;; 10. Test Description: Design a function with a call to another function that also has nested blocks and loops. Add a return instruction in the called function to ensure it correctly returns to the parent function. This test checks if the return instruction can handle cross-functional control flow without target resolution errors.

(assert_invalid
  (module
    (func $callee (result i32)
      (loop (return))
    )
    (func $caller (result i32)
      (call $callee)
    )
  )
  "type mismatch"
)