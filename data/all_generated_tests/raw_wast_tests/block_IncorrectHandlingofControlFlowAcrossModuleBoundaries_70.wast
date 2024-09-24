;; 1. **Incorrect Block Nesting with Imported Function Call**:    - Create a block that contains a call to an imported function which itself contains another block. The test checks if incorrect notation of block invalidates the control flow when returning to the outer block.

(assert_invalid 
  (module 
    (import "env" "externalFunc" (func $externalFunc))
    (func 
      (block 
        (call $externalFunc 
          (block 
            (end 
        ))
        (end 
      ))
  ))
  "incorrect block nesting"
)