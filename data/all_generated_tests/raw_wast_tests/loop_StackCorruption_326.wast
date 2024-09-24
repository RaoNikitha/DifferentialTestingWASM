;; 7. Create a test involving a loop that includes function calls with varying argument and return types. Check for proper handling of the operand stack when these functions are called and returned within loop iterations, ensuring no stack corruption occurs.

(assert_invalid
  (module
    (func $complex-loop
      (result i32)
      (i32.const 0) 
      (loop (result i32)
        (call $dummy1 (i32.const 10))
        (call $dummy2 (f32.const 5.5))
        (br 0)
      )
    )
    (func $dummy1 (param i32) (result i32)
      local.get 0
    )
    (func $dummy2 (param f32) (result f32)
      local.get 0
    )
  )
  "type mismatch"
)