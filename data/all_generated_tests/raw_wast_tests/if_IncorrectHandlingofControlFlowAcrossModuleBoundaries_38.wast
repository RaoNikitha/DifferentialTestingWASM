;; 9. In an `if` block, perform a conditional call to an imported function that has side-effects (e.g., memory write). Check that these side-effects are correctly propagated and observable in the host module.

(assert_invalid
  (module
    (import "env" "side_effect" (func $side_effect))
    (func $test_if_side_effect (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $side_effect)
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)