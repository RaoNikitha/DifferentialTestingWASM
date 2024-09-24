;; 3. **Test Case 3**: Define a loop that calls an imported function with a conditional branch inside (using `br_if`) that modifies the control flow based on a parameter. This will test if both implementations handle the conditional branches correctly and preserve state consistency across module boundaries.

(assert_invalid
  (module
    (import "env" "externalFunction" (func $externalFunction (param i32) (result i32)))
    (func $test
      (i32.const 5)
      (loop (result i32)
        (call $externalFunction)
        (i32.const 1)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)