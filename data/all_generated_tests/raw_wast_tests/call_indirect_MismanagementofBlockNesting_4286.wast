;; Design a module where an outer loop contains nested blocks with dynamic depth jumps using `br_table`. Place a `call_indirect` within these nested blocks and ensure function type and bounds checking remains consistent throughout different nesting levels.

(assert_invalid
  (module
    (type $sig0 (func (param i32)))
    (type $sig1 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $test
      (loop
        (block
          (block
            (block
              (br_table 0 1 2 (i32.const 2))
              (call_indirect (type $sig0) (i32.const 0))
            )
            (call_indirect (type $sig1) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)