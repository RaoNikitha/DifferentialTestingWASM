;; 1. A test that checks for stack underflow by calling a function with fewer arguments than expected and then executing a `return` instruction. The test should verify whether the stack correctly unwinds without missing values.

(assert_invalid
  (module
    (func $stack-underflow-on-return
      (param i32 i32)
      (i32.const 1)
      (return)
    )
  )
  "type mismatch"
)