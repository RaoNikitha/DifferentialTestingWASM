;; 6. Implement a `nop` in a block that contains an indirect call to a function which executes an `unreachable`. Verify that the control flow is accurately handled and the trap only occurs within the called function.

(assert_invalid
  (module
    (type $t0 (func))
    (table 1 funcref)
    (elem (i32.const 0) $unreachable_func)
    (func $unreachable_func (unreachable))
    (func $indirect_call_func
      (block
        (nop)
        (call_indirect (type $t0) (i32.const 0))
      )
    )
  )
  "unreachable executed"
)