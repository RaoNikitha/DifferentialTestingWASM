;; - **Test 7**: Design an `if` block where a `call_indirect` instruction, relying on a dynamically updated table, is conditionally executed. Verify if the target function is accurately resolved and called based on context.

(assert_invalid
  (module
    (type $t0 (func))
    (type $t1 (func (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $t0 $t1)
    (func $f1 (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call_indirect (type $t1) (i32.const 1)))
        (else
          (i32.const 0))))
  )
  "type mismatch"
)