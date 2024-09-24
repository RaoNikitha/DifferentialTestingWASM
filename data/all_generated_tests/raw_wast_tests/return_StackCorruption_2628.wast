;; 7. A test where the `return` instruction is preceded by a sequence of operations that increase and decrease the stack size, ensuring the `return` unwinds only to the function's intended block without corrupting the stack.

(assert_invalid
  (module
    (func $test-stack-manipulation-before-return (result i32)
      (i32.const 0)
      (i32.const 1)
      (drop)
      (i32.const 2)
      (if (then (br 0)))
      (return)
    )
  )
  "type mismatch"
)