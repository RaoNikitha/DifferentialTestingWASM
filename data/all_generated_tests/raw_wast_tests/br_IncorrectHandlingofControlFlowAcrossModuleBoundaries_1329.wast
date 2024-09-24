;; 10. Create a series of nested loops with backward branching (`br`) control instructions alternating exported and imported function calls, ensuring the correct stack-ulings and consistent operand states across module boundary transitions.

(assert_invalid
  (module
    (import "env" "func1" (func $imported_func1 (result i32)))
    (func $test-func
      (block
        (loop
          (block
            (call $imported_func1)
            (br 1)
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)