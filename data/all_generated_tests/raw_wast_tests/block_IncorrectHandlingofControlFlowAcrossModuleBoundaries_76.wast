;; 7. **Exception Handling across Modules**:    - Use a block that invokes an imported function designed to throw an exception and catch it back within the block. This ensures that exception handling does not break control flow continuity across module boundaries.

(assert_invalid
  (module
    (import "env" "throw_exception" (func $throw_exception))
    (func $test
      (block (result i32)
        (call $throw_exception)
      )
    )
  )
  "unreachable code"
)