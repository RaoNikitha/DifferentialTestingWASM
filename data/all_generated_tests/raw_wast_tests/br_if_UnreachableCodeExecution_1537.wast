;; 8. **Test Description:** Design a `block` with nested `loop` constructs where `br_if` is responsible for switching between different loop scopes. Add `unreachable` instructions at points in the program to test that incorrect loop control does not terminate the program unexpectedly.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (block
            (loop
              (br_if 2 (i32.const 1))
              (unreachable)
            )
            (unreachable)
          )
          (br_if 2 (i32.const 1))
          (unreachable)
        )
      )
    )
  )
  "unknown label"
)