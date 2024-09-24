;; 9. **Test 9**: Control flows and operand stack handling:    - Test `call_indirect` within loops and blocks to pop/push operands in nested contexts.    - Verify that the operand stack is correctly maintained through nested control flows.

(assert_invalid
  (module
    (type $type0 (func (param i32) (result i32)))
    (table 1 funcref)
    (func $callee (param i32) (result i32)
      local.get 0
    )
    (elem (i32.const 0) $callee)
    (func (param i32) (result i32)
      block (result i32)
        loop (result i32)
          i32.const 0
          local.get 0
          call_indirect (type $type0)
          br_if 0
        end
      end
    )
  )
  "type mismatch"
)