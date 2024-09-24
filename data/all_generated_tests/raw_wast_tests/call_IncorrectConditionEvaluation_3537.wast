;; 6. **Test Description**: Call a sequence of functions where each contains a `br_if` based on comparison with a zero constant. A bug causing the condition to always evaluate to false should prevent branching, producing observable differences in function call stacks.

(assert_invalid
  (module
    (func $test (result i32)
      (local i32)
      (local.set 0 (i32.const 1))
      (block (br_if 0 (i32.eqz (i32.const 0))))
      (call $next)
    )
    (func $next)
  )
  "type mismatch"
)