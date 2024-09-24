;; 6. Inside a `block`, perform a call to an imported function having its own `block` with an immediate `end`, loop back to complete the call sequence, and validate the stack's state integrity in both implementations.

(assert_invalid
  (module
    (import "env" "externalFunction" (func $externalFunction (result i32)))
    (func
      (block (result i32)
        (call $externalFunction)
        (block (result i32)
          (end)
        )
        (i32.const 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)