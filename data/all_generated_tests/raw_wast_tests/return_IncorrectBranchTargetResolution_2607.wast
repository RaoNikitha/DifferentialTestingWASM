;; - Implement a function with two consecutive returns in nested blocks and check to see if the first return correctly unwinds the outer blocks or if the control flow erroneously proceeds to execute the second return without unwinding all blocks first.

(assert_invalid
  (module
    (func $nested-returns (result i32)
      (block
        (block
          (i32.const 42)
          (return)
          (return)
        )
      )
    )
  )
  "type mismatch"
)