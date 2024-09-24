;; 2. Test a loop that involves a conditional (`br_if`) branching to an imported function. Ensure that both true and false branches maintain stack integrity across module boundaries.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_function))
    (func $test
      (loop (result i32)
        (i32.const 0)
        (br_if 0 (call $external_function))
      )
      (drop)
    )
  )
  "type mismatch"
)