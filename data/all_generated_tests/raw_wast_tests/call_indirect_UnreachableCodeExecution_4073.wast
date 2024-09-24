;; Construct a table with out-of-bounds indices and use the `call_indirect` instruction to index into these invalid entries. Ensure an out-of-bounds index results in an `unreachable` trap, verifying correct boundary checks.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $oob-index (param i32)
      (call_indirect (type 0) (local.get 0))
    )
    (export "test" (func $oob-index))
  )
  "out of bounds table access"
)