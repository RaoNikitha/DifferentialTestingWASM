;; 6. **Invoke Multiple Imports with `nop` Checking Return Values**:    - **Constraint Checked**: Ensures correct handling of multiple function returns with `nop`.    - **Description**: Create a series of imported functions that are called in turn with a `nop` instruction before each call. Verify the returned values and their order of execution are correctly handled across both implementations.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (result i32)))
    (import "env" "func2" (func $func2 (result i32)))
    (func (result i32)
      (nop)
      (call $func1)
      (nop)
      (call $func2)
    )
  )
  "type mismatch"
)