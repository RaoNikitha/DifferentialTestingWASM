;; 4. **Blocks Containing Function Table Indirect Calls**    - Use function tables to make indirect calls to imported functions within a `block`. Verify the stack's integrity before and after the indirect call.    - Examines the integrity of function calls that use tables for indirection, focusing on the transitions back to the block’s context.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $called_func)
    (func $called_func (param i32) (result i32)
      local.get 0
    )
    (func $indirect_call_in_block (result i32)
      (block (result i32)
        (i32.const 0)
        (i32.const 42)
        call_indirect (type $called_func) (table 0)
      )
    )
  )
  "type mismatch"
)