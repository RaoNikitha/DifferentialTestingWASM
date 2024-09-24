;; 2. **Test Description**: Verify a scenario where a `call_indirect` instruction is nested inside a loop, and the called function contains a condition to break the loop on a condition check. Test should ensure that the loop correctly terminates if the called function’s condition is met. This checks if mismatches in condition handling result in infinite loops due to an invalid table entry.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (param i32) (result i32)
      (local.get 0)
      (i32.const 10)
      (i32.eq)
      (if (result i32)
        (then 
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
    (func (export "test")
      (loop $loop
        (i32.const 0)
        (call_indirect (type 1) (i32.const 0))
        (br_if $loop (i32.eqz))
      )
    )
  )
  "type mismatch"
)