;; 6. Use `br_table` with a table containing only one valid target label and provide an index operand greater than zero. This will test whether the implementation correctly traps because the index exceeds the available single target.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table funcref (elem 0))
    (func $br_table_call_indirect
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "index out of bounds"
)