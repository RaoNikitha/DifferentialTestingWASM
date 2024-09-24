;; 7. **Test 7: Indirect Call Leading to `unreachable`**    - Place `unreachable` within functions that are indirectly called using an index.    - Checks how both implementations manage the stack when control flow is diverted indirectly leading to a trap.    - Ensures function call context and stack frame integrity are maintained post-trap.

(assert_invalid
  (module
    (type $t0 (func))
    (table 1 funcref)
    (elem (i32.const 0) $func_unreachable)
    (func $func_unreachable (type $t0)
      (unreachable)
    )
    (func $call_indirect_unreachable
      (call_indirect (type $t0) (i32.const 0))
    )
  )
  "type mismatch"
)