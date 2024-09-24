;; 10. **Deep Nesting with Multiple Early Returns**:     Develop a deeply nested block of functions, each containing `return` statements.     - Tests the correctness of CFG representation and stack unwinding in complex, nested scenarios.

(assert_invalid
 (module
  (func $deep-nested-with-early-returns (result i32)
   (block
    (block
     (block
      (block
       (block
        (br 1)
        (return (i32.const 1))
       )
       (return (i32.const 2))
      )
      (return (i32.const 3))
     )
     (return (i32.const 4))
    )
    (return (i32.const 5))
   )
   (i32.const 6)
  )
 )
 "type mismatch"
)