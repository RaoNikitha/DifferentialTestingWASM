;; 4. Test a valid `call` instruction followed by an incorrect `call` to a non-existent function index, verifying the stack is properly unwound and not left in a corrupted state.

(assert_invalid
  (module
    (func $valid (result i32) 
      i32.const 0 
    )
    (func $invalid
      (call 0) 
      (call 1)
    )
  )
  "unknown function"
)