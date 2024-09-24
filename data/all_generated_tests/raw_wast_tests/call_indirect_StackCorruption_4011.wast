;; - Test 10: Create a test where the `call_indirect` instruction is used with exactly the correct number of parameters expected, but include an additional `call_indirect` immediately afterward. If the first call does not manage the stack correctly, it will cause corruption visible to the second call. Check if the implementation handles such nested calls without leading to underflow or overflow on the stack.

(assert_trap
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (func $f (param i32) (result i32)
      local.get 0
    )
    (func $g (param i32)
    )
    (table funcref (elem $f $g)) 
    (func (param i32) (result i32)
      local.get 0
      call_indirect (type 0) (i32.const 0)  ;; First call_indirect
      call_indirect (type 1) (i32.const 1)  ;; Nested call_indirect to check stack handling
    )
  )
  "unreachable"
)