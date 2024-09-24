;; 8. **Test Description:**    A scenario involving a loop that calls a function which returns a struct type, while the loop expects a primitive type. This checks for proper handling of complex return types inside loops.

(assert_invalid
  (module
    (type $struct_t (struct (field i32) (field i32)))
    (func $complex_return (result (ref $struct_t)) (unreachable))
    (func $test_loop (result i32)
      (loop (result i32)
        (call $complex_return)
      )
    )
  )
  "type mismatch"
)