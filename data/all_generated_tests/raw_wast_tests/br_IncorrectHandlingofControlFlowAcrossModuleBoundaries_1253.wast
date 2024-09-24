;; 4. **Test Description:**    Construct a nested structured control (`block`) in one module and an imported function that uses a `br` instruction to break out of these nested structures. Verify that the operand stack unwinding and execution flow transition back to the calling module as expected.

(assert_invalid
  (module
    (func $outer (param i32)
      (block
        (block
          (br 2)
        )
      )
    )
    (import "env" "inner" (func $inner (param i32)))
  )
  "unknown label referenced in br"
)