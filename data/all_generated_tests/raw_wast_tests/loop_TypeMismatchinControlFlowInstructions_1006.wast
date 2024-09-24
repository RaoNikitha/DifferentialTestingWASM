;; 7. **Test for Invalid Type in Loop Result**: Create a loop that contains instructions pushing results of types different from the block type declared for the loop.

(assert_invalid
  (module
    (func $invalid_type_in_loop
      (loop (result i32)
        (i32.const 1)
        (f64.const 0.5)  ; incorrect type for loop result
      )
    )
  )
  "type mismatch"
)