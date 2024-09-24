;; - Test 10: Design complex branching logic within a function, involving multiple `if-else` blocks and indirect calls with `br`, to test if branch targets post function calls resolve accurately to their respective `else` or merge blocks.

(assert_invalid
  (module
    (type $ty (func (result i32)))
    (table 1 funcref)
    (func $nested-call (param i32) (result i32)
      local.get 0
      if (result i32)
        local.get 0
        i32.const 1
        i32.add
        call_indirect (type $ty) (i32.const 0)  ;; indirect call
        br_if 0
      else
        i32.const 2
      end
    )
  )
  "type mismatch"
)