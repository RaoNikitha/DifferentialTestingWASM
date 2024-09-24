;; 3. **Test Description 3**:    - Construct a `loop` that repeatedly attempts a `call_indirect` with mismatched operand types. The operand stack is manipulated such that it continuously fails type checking, resulting in an infinite loop scenario.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $loop-indirect-mismatch
      (loop
        (i32.const 0)
        (i32.const 0)
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)