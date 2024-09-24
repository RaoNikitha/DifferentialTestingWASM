;; 4. A test with a loop that contains multiple `return` instructions. The focus should be on whether the stack is correctly managed when multiple returns are executed sequentially, ensuring the stack remains consistent.

(assert_invalid
  (module
    (func $type-loop-multiple-returns
      (i32.const 1)
      (loop (result i32)
        (return (i32.const 42))
        (return (i32.const 43))
      )
    )
  )
  "type mismatch"
)