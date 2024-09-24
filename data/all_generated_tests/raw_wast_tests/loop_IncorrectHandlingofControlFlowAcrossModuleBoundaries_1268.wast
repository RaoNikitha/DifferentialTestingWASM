;; 9. **Loop Exit via Imported Function**:    - **Description**: The `loop` in module A is designed to exit usually but incorporates a call to an imported function from module B. The loop termination should be confirmed via control transfer through the imported function without side effects.    - **Constraint**: Check for correct exit behavior and side-effect-free operation of the loop even when involving cross-module calls.

(assert_invalid
  (module
    (import "moduleB" "exit" (func $exit))
    (func $loop_with_imported_call
      (loop (result i32)
        (call $exit)
        (br_if 0 (i32.const 0))
      )
      (unreachable)
    )
  )
  "type mismatch"
)