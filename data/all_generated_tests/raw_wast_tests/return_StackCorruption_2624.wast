;; 3. A test that pushes multiple values onto the stack, calls a function that returns a different number of values, and then immediately executes a `return` instruction. This checks whether the stack can handle the change in stack height without errors.

(assert_invalid
  (module
    (func $test (result i32)
      (i32.const 42)
      (i32.const 99)
      (call $foo)
      (return)
    )
    (func $foo (result i32 i32)
      (i32.const 1)
      (i32.const 2)
    )
  )
  "type mismatch"
)