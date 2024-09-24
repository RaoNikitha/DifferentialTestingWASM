;; Test 1: Create a function with nested blocks where the `return` is used in an inner block after some stack operations. Reason: Tests if stack unwinding works correctly. If inner block operations are not discarded properly, it reaches `unreachable`.

(assert_invalid
  (module
    (func $type-nested-blocks-with-return (result i32)
      (block
        (block
          (i32.const 1)
          (return)
          (i32.const 2)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)