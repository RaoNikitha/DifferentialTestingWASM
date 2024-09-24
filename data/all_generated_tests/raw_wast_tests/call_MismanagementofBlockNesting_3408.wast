;; 7. **Loop with Dynamic Function Calls**: Form a scenario where nested loops involve dynamic function calls that alter global states used within `br_table` conditions. This tests if the dynamic nature of calls and global state changes are correctly interpreted in the context of block depth management.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $dynamicCall (param i32) (result i32)
      global.get $g
      local.get 0
      i32.add
      global.set $g
      global.get $g
    )
    (func (param i32)
      local.get 0
      i32.const 5
      loop (param i32) (result i32)
        local.get 0
        i32.const 10
        call $dynamicCall
        local.get 0
        i32.add
        br_if 0
      end
      drop
    )
    (func (param i32) (result i32)
      loop $outer (param i32) (result i32)
        local.get 0
        i32.const 3
        loop $inner (param i32) (result i32)
          local.get 0
          i32.const 2
          call $dynamicCall
          local.get 0
          i32.add
          br_if $inner
        end
        br_table $outer
      end
    )
  )
  "block depth management mismatch"
)