;; 9. Create a complex branching scenario with multiple nested `if` blocks, where mixed conditions must avoid paths leading to `unreachable` instructions. Validate that incorrect branching causes immediate traps.

(assert_invalid
  (module
    (func $nested-complex-if (param i32) (result i32)
      ;; Nested `if` with mixed conditions and potential path to `unreachable`
      (if (param i32) ;; Outer `if`, expecting an i32 parameter
        (if (i32.eqz (local.get 0))
          ;; First branch with a condition
          (then (if (i32.const 1)
                    (then (unreachable))
                    (else (i32.const 2))))
          (else (if (i32.const 0)
                    (then (i32.const 3))
                    (else (unreachable))))
        )
        ;; Second branch which is valid
        (else (i32.const 4))
      )
    )
  )
  "type mismatch"
)