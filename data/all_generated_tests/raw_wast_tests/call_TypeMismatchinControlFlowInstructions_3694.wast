;; 3. **Test 3**: Test contains a loop that expects `[i32, i32]` arguments, but calls a function returning `[i32, f32]`. This checks the behavior when the loop structuring mismatches the function's return types in the control flow.

(assert_invalid
  (module
    (func $loop-mismatch 
      (param i32 i32) 
      (result i32)
      (local $i i32)
      (local.set $i (i32.const 10))
      (loop $loop
        (call $returns-i32-f32 
          (local.get $i)
          (local.get $i)
        )
        (br_if $loop (i32.const 1))
      )
    )
    (func $returns-i32-f32 (param i32 i32) (result i32 f32)
      (i32.const 1) (f32.const 1.0)
    )
  )
  "type mismatch"
)