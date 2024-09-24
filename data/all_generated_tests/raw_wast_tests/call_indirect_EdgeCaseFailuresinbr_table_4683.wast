;; 2. **Out-of-Bounds Index Testing**:    Provide a `br_table` instruction with an index that exceeds the number of targets to check if the implementation correctly traps for an out-of-bounds index.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $oob-index-test
      (call_indirect (type $sig) (i32.const 10) (i32.const 0))
    )
  )
  "out-of-bounds table index"
)