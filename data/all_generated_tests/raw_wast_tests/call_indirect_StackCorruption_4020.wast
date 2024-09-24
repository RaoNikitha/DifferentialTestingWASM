;; 9. Validate proper operand handling by calling a function via `call_indirect` that modifies its operand stack mid-execution (e.g., pop and push intermediate values) and then traps, ensuring no stack corruption upon exit.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $sig_trap (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func_to_call)
    (func $func_to_call (type $sig)
      local.get 0
      i32.const 1
      i32.add
      i32.const 2
      if
        drop
        i32.const 3
        i32.add
      end
      local.get 0
      if
        unreachable
      end
      i32.const 0
    )
    (func (call_indirect (type $sig_trap) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)