;; 8. **Test 8**: Develop a nested block configuration where a return from an inner block invokes a function that throws an exception. This test observes how both implementations manage stack unwinding and function call integrity during exceptional control flows.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (type $t1 (func))
    (func $throw (type $t1) (unreachable))
    (func $nested-blocks (type $t0) (result i32)
      (block (result i32)
        (block (result i32)
          (call $throw) (br 1)
        ) (i32.const 0)
      ) (br 0 (i32.const 1))
    )
  )
  "unreachable code due to exception"
)