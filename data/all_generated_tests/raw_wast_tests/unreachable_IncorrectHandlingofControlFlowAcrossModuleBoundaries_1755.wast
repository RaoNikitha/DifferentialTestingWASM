;; 6. **Test 6: `unreachable` in an Imported Function within Exception Handling Block**    - Description: Wrap a call to an imported function containing `unreachable` inside a try-catch block and verify that the trap is correctly propagated and caught.    - Constraint Checked: Checks the consistency of exception handling mechanisms when traps originate from imported functions across module boundaries.    - Relation: Tests compatibility and correctness of exception handling across module calls.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $test
      (try (result i32)
        (do
          (call $externalFunc)
          unreachable
        )
        (catch_all
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)