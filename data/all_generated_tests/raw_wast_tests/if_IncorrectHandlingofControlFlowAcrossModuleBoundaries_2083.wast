;; 4. **Test Description:**    Evaluate an `if` instruction that conditionally executes a function imported from another module, followed by an immediate branch to another block. The test aims to verify if the operand stack is correctly managed after the function returns and the subsequent branch instruction correctly references the intended block label, without stack misalignment or incorrect control flow.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_function (result i32)))
    (func $test_function
      (if (i32.const 1)
        (then
          (call $external_function)
          (br 1)
        )
      )
    )
  )
  "unknown label"
)