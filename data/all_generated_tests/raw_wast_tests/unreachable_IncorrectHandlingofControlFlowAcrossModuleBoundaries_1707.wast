;; Test 8: Insert an unreachable instruction after a multi-value return from an imported function call. Check if the trap affects modules using those return values.

(assert_invalid
  (module
    (func (import "env" "multi_return_function") (result i32 i32))
    (func
      (call $multi_return_function)
      (unreachable)
      (drop)
    )
  )
  "type mismatch"
)