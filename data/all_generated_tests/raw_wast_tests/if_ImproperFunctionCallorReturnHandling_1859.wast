;; 10. A scenario where nested `if` statements make multiple function calls with inconsistent return types, attempting to create impossible stack states, while the `else` sections perform simple stack manipulations. It tests consistency and error detection for deep nested calls within control flow.

(assert_invalid
  (module
    (func $nested_if_inconsistent_stack (param i32) (result i32)
      (i32.const 1)
      (if (result i32)
        (call $inconsistent_return)
        (if (result i32)
          (call $another_inconsistent_return)
          (else
            (i32.const 1)))
        (else
          (i32.const 0)
          (drop)
          (i32.const 2)))))
  "type mismatch")