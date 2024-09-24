;; 3. **Test Description**: Implement `call_indirect` within a block nested inside another block followed by a `br_table` that should break out to an outer, larger parent block. The test verifies whether the implementation correctly interprets the jump depth.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test
      (block
        (block
          (call_indirect (type 0) (i32.const 0))
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)