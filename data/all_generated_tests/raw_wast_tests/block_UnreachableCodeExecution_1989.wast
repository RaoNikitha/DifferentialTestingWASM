;; 10. **Test Description**: A `block` instruction immediately after a function call within another `block`, where the function’s incorrect return triggers an `unreachable` scenario inside the second `block`. This tests function call integration within `block` instructions, examining stack unwinding and type conformance in the presence of an error.

(assert_invalid
  (module
    (func $foo (result i32) (unreachable))
    (func $test
      (block (result i32)
        (call $foo)
        (block (result i32)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)