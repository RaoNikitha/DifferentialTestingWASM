;; 10. **Test 10**: Design a complex control flow with conditional branches, endorsing `nop` instructions intermittently, ending with `unreachable` to verify that correct paths do not prematurely lead to unreachable execution, ensuring proper branch handling.

(assert_invalid
  (module
    (func $conditional-unreachable (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.const 1))
      (if (i32.eq (local.get 0) (local.get 1))
        (then
          nop
          unreachable)
        (else
          nop
          (local.set 1 (i32.const 0))
        )
      )
      (local.get 1)
    )
  )
  "expected unreachable"
)