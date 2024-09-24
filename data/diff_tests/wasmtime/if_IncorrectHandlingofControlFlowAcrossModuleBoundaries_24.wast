;; 5. **Test Description**: A recursive function containing an `if-else` block, where recursive calls are made in both the `then` and `else` parts, interacting with imported and exported functions.    **Constraint**: Ensures recursion, especially with different branches involving cross-module calls, maintains stack and state consistency.    **Goal**: Tests for stack overflows and improper recursion management due to control flow mishandling.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $recursiveFunc (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then
          (call $externalFunc)
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (call $recursiveFunc)
        )
        (else
          (i32.const 0)
        )
      )
    )
    (export "recursiveFunc" (func $recursiveFunc))
  )
  "stack overflow or improper recursion management"
)