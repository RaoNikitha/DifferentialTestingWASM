;; 2. **Test Description:**    Create a scenario where an `if` instruction conditionally calls an imported function that itself performs a call back into the original module. This test checks if the contexts and operand stacks remain correctly preserved across nested module calls, ensuring no incorrect control flow or stack corruption arises from recursive cross-boundary calls.

(assert_invalid
  (module
    (import "env" "callback" (func $callback (result i32)))
    (func $recursive (result i32)
      (if (result i32)
        (call $callback)
        (then (i32.const 42))
        (else (call $recursive))
      )
    )
    (export "test" (func $recursive))
  )
  "context or stack preservation error"
)