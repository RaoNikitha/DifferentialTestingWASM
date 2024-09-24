;; 4. **Test Description:**    An `if-else` construct with a `br_if` in the `then` block based on an integer comparison. The `else` block should contain another `br_if` with an opposite condition. Test should ensure conditions are evaluated correctly and control flow follows intended paths.    - **Constraint:** Checks correct evaluation of integer comparison conditions in conditional branches.

(assert_invalid
  (module
    (func $if_else_br_if
      (local $cond i32)
      (local.set $cond (i32.const 1))
      (if (result i32)
        (i32.eqz (local.get $cond))
        (then (br_if 0 (i32.const 1)))
        (else (br_if 0 (i32.eqz (i32.const 0))))
      )
    )
  )
  "type mismatch"
)