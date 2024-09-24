;; 1. Test a straightforward `if` block where an indirect function call is used both in the `then` and `else` branches, checking for correct type enforcement on both paths.

(assert_invalid
  (module
    (type $functype (func))
    (func $test (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call_indirect (type $functype) (i32.const 0) (i32.const 0))
        )
        (else
          (call_indirect (type $functype) (i32.const 0) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)