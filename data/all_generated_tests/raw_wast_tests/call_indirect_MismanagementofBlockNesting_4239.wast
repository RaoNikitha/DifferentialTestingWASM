;; 8. **Test 8**: Dynamic type mismatches in nested structures:    - Insert `call_indirect` within nested structures aiming to mismatch the dynamic type checks purposely.    - Ensure traps occur correctly in nested contexts rather than mismanaging control flow.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func $f (param i32))
    (func $test
      (i32.const 0)
      (block
        (loop
          (block
            (call_indirect (type $sig) (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)