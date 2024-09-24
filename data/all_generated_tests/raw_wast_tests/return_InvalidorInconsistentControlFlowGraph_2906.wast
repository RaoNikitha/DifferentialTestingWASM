;; 5. Design a function with several `block` constructs where one block has fall-through behavior after a `return`, leading to type mismatches in later stack operations in WebAssembly, and examine if the Wizard Engine correctly identifies unreachable code paths.

(assert_invalid
  (module
    (func $fallthrough-after-return (result i32)
      (block
        (block
          (return (i32.const 42))
        )
        (i32.const 1) ;; This should be unreachable after the return
      )
      (i32.const 0) ;; This stack operation should cause a type mismatch
    )
  )
  "type mismatch"
)