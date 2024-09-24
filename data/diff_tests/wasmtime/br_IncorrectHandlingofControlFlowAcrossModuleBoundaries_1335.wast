;; 6. **Test Description 6:**    - **Focus:** Loop behavior with module boundary transitions.    - **Constraint:** Verify that backward branches to loops correctly handle transitions between calling modules and imported functions.    - **Incorrect Handling:** Incorrect behavior of backward branches leading to improper loop iterations.

(assert_invalid
  (module
    (func $test_loop_transition (import "env" "importedFunction"))
    (func $loop_test
      (block
        (loop $label0
          (call $test_loop_transition)
          (br $label0)
        )
      )
    )
  )
  "unknown label"
)