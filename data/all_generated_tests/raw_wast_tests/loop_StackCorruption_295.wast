;; - **Test 6**: Use a loop containing indirect function calls (through a function table). Within the loop, perform branches and stack operations before these calls to verify if stack integrity is preserved during and after the indirect calls. Check for stack growth and shrinking correctly managing reserved space.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table anyfunc (elem $f))
    (func $f (type $t) (param i32) (result i32)
      local.get 0
    )
    (func (param i32)
      local.get 0
      (loop (param i32) 
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        i32.const 0
        (call_indirect (type $t))
        br_if 0
      )
    )
  )
  "type mismatch"
)