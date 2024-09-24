;; - **Test Description 4**: An `if` instruction with a condition evaluated using stack manipulation (e.g., `i32.const 3, i32.const 2, i32.sub, i32.const 1, i32.eq`). Expect the control flow to enter the `then` block because the subtraction results in zero. Validate branches are taken correctly after condition checks.

(assert_invalid
  (module (func $test-condition-stack-manip (result i32)
    (if (result i32) (i32.const 3) (i32.const 2) (i32.sub) (i32.const 1) (i32.eq) 
      (then (i32.const 42)) (else (i32.const 0)))
  ))
  "type mismatch"
)