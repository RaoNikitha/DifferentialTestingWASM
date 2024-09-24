;; - **Test 10**: Implement an `if` block conditional call to imported functions and compare the return values within the `else` block. Check if the context and returns maintain consistent handling across the borders of imported modules.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $test 
      (if (result i32) (i32.const 1)
        (then (i32.add (call $externalFunc) (i32.const 1)))
        (else (i32.add (call $externalFunc) (i32.const 2)))
      )
    )
  )
  "type mismatch"
)