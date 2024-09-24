;; 9. Generate a module holding nested blocks with a complex combination of loops and conditional branches, employing `call_indirect` at various depths. Each instruction’s index value changes dynamically, making sure the nesting level remains accurate.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i32)))
    (table 2 funcref)
    (func $func1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 10))
    )
    (func $func2 (param i64) (result i32)
      (i32.wrap_i64 (local.get 0))
    )
    (elem (i32.const 0) $func1 $func2)
    (func $nested-test
      (i32.const 0)
      (block
        (loop
          (if (i32.eqz (local.get 0))
            (then
              (i32.const 0)
              (call_indirect (type $sig1) (i32.const 1))
              (if (i32.eq (i32.const 1) (i32.const 1))
                (then
                  (loop
                    (i32.const 0)
                    (call_indirect (type $sig2) (i32.const 0))
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)