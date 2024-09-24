;; **Test 7**: Construct a test module where a `call_indirect` is conditionally included based on a function parameter (e.g., if-else statements). Design the module so that the type index is dynamically invalid in one of the branches. This test checks if the implementations correctly align conditional branches in the CFG and manage error handling within branching contexts.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $conditional-call-indirect (param i32)
      (if (i32.eqz (local.get 0))
        (then
          (call_indirect (type $sig) (i32.const 0))
        )
        (else
          (call_indirect (type 999) (i32.const 0))
        )
      )
    )
  )
  "unknown type"
)