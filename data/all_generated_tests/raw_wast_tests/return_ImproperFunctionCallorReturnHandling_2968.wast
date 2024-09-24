;; 7. Validate the behavior of nested conditional returns within a function. Check if both engines correctly handle stack unwinding from nested scopes and outer function scope, focusing on handling operands introduced within conditionals.

(assert_invalid
  (module
    (func $nested-conditional-returns (param i32) (result i32)
      (local i32)
      (i32.const 42)
      (local.set 0)
      (block (result i32)
        (if (i32.eqz (local.get 0))
          (then
            (return (i32.const 1))
          )
          (else
            (if (i32.eq (local.get 0) (i32.const 42))
              (then
                (return (local.get 0))
              )
              (else
                (return (i32.const 7))))))
      )
      (local.get 0)
    )
  )
  "type mismatch"
)