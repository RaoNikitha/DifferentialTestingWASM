;; 5. Set up a loop in the host module that repeatedly calls an imported function. Ensure that the module transition is handled correctly and that the loop execution remains consistent without stack corruption or incorrect control flow, particularly checking the handling of valid and invalid function indices.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test_loop
      (local i32)
      (block
        (loop
          (local.set 0 (call $external_func (i32.const 1)))
          br 0
        )
      )
    )
  )
  "unknown function"
)