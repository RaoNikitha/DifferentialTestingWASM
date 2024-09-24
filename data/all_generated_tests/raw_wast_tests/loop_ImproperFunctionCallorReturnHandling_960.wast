;; 1. Create a loop that contains a `call` instruction to a function returning a single value. The loop continues based on a condition that checks the returned value. This tests if both implementations correctly manage function returns within a loop context and properly reinitialize on each backward branch.

(assert_invalid
  (module 
    (func $foo (result i32)
      (i32.const 1))
    (func $loop_test
      (result i32)
      (loop (result i32)
        (call $foo)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)