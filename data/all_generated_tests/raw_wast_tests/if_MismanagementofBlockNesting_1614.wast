;; 5. **Test with Unreachable in Nested `if` Blocks**: Place `unreachable` instructions in nested `if` blocks to trigger traps, ensuring these are correctly handled without causing misnavigations in nested block terminations.

(assert_invalid
  (module
    (func $test-unreachable-nested-if
      (block
        (if (i32.const 1)
          (then
            (if (i32.const 0)
              (then (unreachable))
              (else (nop))
            )
          )
          (else (nop))
        )
      )
    )
  )
  "type mismatch"
)