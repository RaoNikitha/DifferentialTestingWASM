;; 3. **Test Description**: Design a nested function call where the inner function immediately hits an `unreachable` instruction due to a mismatch in argument types, testing if the engine correctly pops the stack.

(assert_invalid
  (module
    (func $inner (param i32) unreachable)
    (func $outer (param i32) 
      (call $inner (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)