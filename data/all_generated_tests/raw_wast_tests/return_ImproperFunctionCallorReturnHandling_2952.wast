;; 1. Test a function returning a value while having intermediate computations:    - Call a function that performs several operations, pushing values onto the stack, before performing a `return` instruction.    - Check if the intermediate values are correctly discarded, leaving only the return value on the stack.

(assert_invalid
  (module
    (func $test-return-intermediate-values (result i32)
      (i32.const 42)
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
      (return)
    )
  )
  "type mismatch"
)