;; Generate a loop with a nested `call` function that specifically sets a return value, and then immediately branch out to a non-existent label. This tests whether return values are correctly maintained in the stack and different handling between context models.

(assert_invalid
  (module (func $test-loop-nested-call-branch
    (block 
      (loop (result i32)
        (call $set-return)
        (br 2) 
      )
    )
  ))
  "label index out of bounds"
)