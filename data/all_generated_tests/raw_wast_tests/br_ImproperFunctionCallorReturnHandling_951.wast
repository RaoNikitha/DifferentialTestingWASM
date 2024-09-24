;; 2. **Test 2: Nested `block` with Function Return and Unwound Stack**    - **Description:** Create a nested `block` structure where an inner block calls a function, followed by a `br` instruction that unwinds the stack to the outer block. Verify proper stack restoration.    - **Reasoning:** Tests whether stack unwinding correctly handles contexts with nested function returns when branching out.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (call $some_function)
          (br 1)
        )
        (i32.const 0)
        (i32.eqz)
        (drop)
      )
    )
    (func $some_function (result i32)
      (i32.const 1)
    )
  )
  "type mismatch"
)