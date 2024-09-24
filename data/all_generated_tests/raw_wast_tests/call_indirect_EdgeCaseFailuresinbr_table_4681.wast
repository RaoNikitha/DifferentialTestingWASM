;; 10. A `br_table` instruction with a large number of branch targets, testing for performance issues or stack overflow handling within both implementations, particularly stressing memory and operational handling for large tables.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 102400 funcref)
    (func (param i32) (result i32)
      (local.get 0)
      (call_indirect (type 0) (local.get 0))
    )
  )
  "large number of table entries"
)