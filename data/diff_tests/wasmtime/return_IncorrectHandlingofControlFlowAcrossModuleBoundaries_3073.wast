;; 2. **Test 2: Returning Value from Imported Function**    - Description: Create a module that imports a function which returns a value and tests if the calling function correctly captures and handles the returned value.    - Relation: This test examines if the transition between modules correctly passes return values without causing stack corruption.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $testFunc (result i32)
      (call $externalFunc)
      (return)
    )
  )
  "type mismatch"
)