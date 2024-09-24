;; 5. **Test Description**: Nest a `call_indirect` instruction within a loop that contains a `br_table` instruction to ensure that the correct block breaks are being respected when an indirect function call is made. This tests the correct jumping out of multiple loop layers.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem))
    (func (block
      (loop
        br 1
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
        br_table 0 0 (i32.const 1)
      )
    ))
  )
  "type mismatch"
)