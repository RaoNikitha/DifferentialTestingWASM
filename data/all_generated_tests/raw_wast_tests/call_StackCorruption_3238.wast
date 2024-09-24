;; Test simultaneous calls to several functions with varying input and output types. This examines the robustness of stack operations and management of mixed-type data.

(assert_invalid
  (module
    (func $f1 (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.add
    )
    (func $f2 (param f32) (result f32)
      local.get 0
      f32.neg
    )
    (func $f3 (param i64) (result i64 i64)
      local.get 0
      local.get 0
    )
    (func
      i32.const 10
      i32.const 20
      call $f1
      f32.const 3.14
      call $f2
      i64.const 42
      call $f3
    )
  )
  "type mismatch"
)