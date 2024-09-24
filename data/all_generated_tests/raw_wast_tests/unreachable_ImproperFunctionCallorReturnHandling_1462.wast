;; 3. **Test Description:**    - Nested function call where the inner function reaches `unreachable` and verify if the trap correctly propagates to outer function call.    - This test inspects the proper handing of control flow when nested function calls encounter `unreachable`.

(assert_trap
  (module 
    (func $inner (unreachable))
    (func $outer
      (call $inner)
      (i32.const 0)  ; Dummy code to ensure nesting
      drop
    )
    (start $outer)
  )
  "unreachable"
)