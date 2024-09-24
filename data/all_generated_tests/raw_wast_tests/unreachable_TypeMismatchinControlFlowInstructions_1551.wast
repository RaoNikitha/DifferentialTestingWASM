;; 2. **Test Description:**    - Place `unreachable` inside a `loop` that is supposed to loop over an `i32` variable, and immediately follow `unreachable` with another `i32` operation. Verify if the trap is triggered before the type mismatch causes an error.    - **Constraint Checked:** Ensures `loop` correctly acknowledges the type immediately after encountering `unreachable`.    - **Relation to Type Mismatch:** Ensures that type checks are enforced before and after control flow instructions when `unreachable` is encountered.

(assert_invalid
  (module (func $test-loop-unreachable-type-mismatch (result i32)
    (loop (result i32)
      (unreachable)
      (i32.const 0)
    )
  ))
  "type mismatch"
)