;; **Test 3**: Call a function that consumes multiple argument types and ensure the right order of arguments is used. Check for conditions where the wrong argument type might lead to an incorrect function invocation in wizard_engine.

(assert_invalid
  (module
    (func $multi-arg (param i32 f32) (result f32)
      local.get 0
      local.get 1
      f32.add
    )
    (func
      i32.const 1
      f32.const 2.0
      call $multi-arg
      drop
    )
  )
  "type mismatch"
)