;; 8. **Test Description:**     In a recursive function, introduce `unreachable` after a recursive self-call and check proper trapping without further recursion or return.    **Constraint Checked:** Correct trap handling in recursive calls.    **Relation to Improper Call/Return Handling:** Ensures recursion halts upon hitting `unreachable` and does not improperly continue or return.

(assert_invalid
  (module
    (func $recursive_unreachable (param $n i32) (result i32)
      local.get $n
      i32.const 0
      i32.eq
      if (result i32)
        i32.const 0
      else
        local.get $n
        i32.const 1
        i32.sub
        call $recursive_unreachable
        unreachable
      end
    )
    (export "recursive_unreachable" (func $recursive_unreachable))
  )
  "type mismatch"
)