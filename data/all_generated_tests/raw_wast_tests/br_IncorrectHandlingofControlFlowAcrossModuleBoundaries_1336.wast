;; 7. **Test Description 7:**    - **Focus:** Forward branching from blocks within module imports.    - **Constraint:** Ensure forward branches to blocks within imported modules correctly resume execution after the `end` instruction.    - **Incorrect Handling:** Forward branch not resuming correctly, leading to unexpected execution flow.

(assert_invalid
  (module
    (import "env" "someImportedFunc" (func $someImportedFunc))
    (func $test
      (block (result i32)
        (block
          (block (result i32)
            (br 1)
          )
          (call $someImportedFunc)
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)