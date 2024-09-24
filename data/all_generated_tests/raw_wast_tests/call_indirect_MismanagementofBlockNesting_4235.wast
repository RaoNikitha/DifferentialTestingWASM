;; 4. **Test 4**: Conditional branches within nested blocks:    - Design a test where `call_indirect` is called within an `if` branch nested inside blocks.    - Ensure that the conditional execution does not cause the `call_indirect` to mismanage the nesting and operate correctly in all branches.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32))
    (table funcref (elem $f))
    (func $test (param i32)
      (block
        (block
          (if (result i32)
            (i32.const 1)
            (call_indirect (type $sig) (i32.const 0) (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)