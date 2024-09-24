;; 7. **Test Description 7**:    - Implement a `call_indirect` within a `loop` that always accesses an empty table. The table index always being invalid causes an infinite loop since the function to call never resolves correctly.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $infinite-loop
      (loop
        (call_indirect (type 0) (i32.const 0))
        (br 0)
      )
    )
  )
  "infinite loop due to empty table"
)