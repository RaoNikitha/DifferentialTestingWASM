;; 2. **Test 2**: Nested loops with `call_indirect`:    - Include nested loops where a `call_indirect` instruction is executed.    - Verify if the instruction honors the correct loop nesting by successfully calling the indirect function and not trapping.

(assert_invalid
  (module
    (type $t0 (func (param i32)))
    (type $t1 (func))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (type $t1))
    (func
      (block $outer
        (loop $inner
          (call_indirect (type $t0) (i32.const 0) (local.get 0))
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)