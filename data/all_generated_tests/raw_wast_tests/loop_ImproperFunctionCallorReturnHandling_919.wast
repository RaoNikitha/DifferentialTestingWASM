;; 10. **Test: Mixed Direct and Indirect Function Calls in Loop**     - Description: Design a loop containing both direct (`call`) and indirect (`call_indirect`) function calls. The functions should perform different operations before the loop continues. Ensure the correct function is called and the loop correctly handles both call types.     - Constraint: Ensures proper differentiation and handling of direct and indirect function calls within loops.

(assert_invalid
  (module
    (type $type1 (func (param i32) (result i32)))
    (type $type2 (func (param i32) (result i32)))
    (func $direct (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
    )
    (table 1 funcref)
    (elem (i32.const 0) $direct)
    (func $indirect (param i32) (result i32)
      local.get 0
      i32.const 2
      i32.add
    )
    (func $main (param i32) (result i32)
      local.get 0
      loop (param i32) (result i32)
        local.get 0
        call $direct
        local.get 0
        i32.const 0
        call_indirect (type $type2)
        drop
        br_if 0
      end
    )
  )
  "type mismatch"
)