;; 7. Design a block expecting a tuple (int, bool) as a result type, and inside it, prepare to branch out with only an integer on the stack. This checks if the implementation enforces the expectation that both an integer and boolean are required.

(assert_invalid
  (module
    (func
      (block (result i32 i32)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)