;; 7. **Test Description**: Build an `if` block with intricate data dependencies, where the condition is based on loaded values from memory. This tests the accuracy of evaluating conditions involving external memory reads.

(assert_invalid
  (module 
    (memory 1)
    (func $test-if-memory-condition (result i32)
      (i32.load (i32.const 0))
      (if (result i32) (i32.const 1)
        (then (i32.const 42))
        (else (i32.const 84))
      )
    )
  )
  "type mismatch"
)