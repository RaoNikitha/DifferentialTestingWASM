;; 9. **Test Case 9: Import Function that Emits Trap in a Loop**    - **Description:** Module A imports a function from Module B which repeatedly calls a local function with a loop that eventually hits `unreachable`. This checks repeated traps and proper looping logic continuity across module boundaries.

(assert_invalid
  (module
    (import "moduleB" "importedFunc" (func $importedFunc))
    (func $localFunc
      (block (unreachable))
    )
    (func $testFunc
      (loop
        (call $importedFunc)
        (call $localFunc)
      )
    )
  )
  "type mismatch"
)