;; 5. Design a test with a complex control flow graph where inner blocks contain `call_indirect` instructions, followed by `br_table` instructions. The differential behavior appears when the signature handling causes `br_table` to choose an unintended block return value target.

(assert_invalid
  (module
    (type $sig0 (func (result i32)))
    (type $sig1 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func0)
    (func $func0 (param i32) (br_table 0 0 (local.get 0)))
    (func $test
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (then (call_indirect (type $sig1) (i32.const 1) (i32.const 0)))
            (else (block (result i32)
                    (call_indirect (type $sig1) (i32.const 0) (i32.const 1))
                    (br_table 1 0 (i32.const 0))
                  )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)