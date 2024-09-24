;; 4. Construct a deeply nested recursive function that relies on proper index validation. The test checks if the index out of bound is correctly trapped by the WebAssembly implementation, preventing infinite recursion, whereas the `wizard_engine` might loop indefinitely.

(assert_invalid 
  (module 
    (func $deep_recursion
      (call 1) 
      (call 1) 
      (call 1)
    )
    (func (call $deep_recursion))
  )
  "unknown function"
)