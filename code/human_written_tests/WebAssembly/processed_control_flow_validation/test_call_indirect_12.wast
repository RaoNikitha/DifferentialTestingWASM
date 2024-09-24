(assert_invalid
  (module
    (type (func))
    (func $no-table (call_indirect (type 0) (i32.const 0)))
  )
  "unknown table"
)