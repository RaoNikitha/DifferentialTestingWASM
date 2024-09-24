;; 3. Develop an `if` block where a function is called in the `then` block and another function in the `else` block, both functions having different argument and return types, ensuring proper stack handling.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f32) (result f32)))
    (func $func1 (type $sig1) (param i32) (result i32)
      local.get 0
    )
    (func $func2 (type $sig2) (param f32) (result f32)
      local.get 0
    )
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $func1 (i32.const 10))
        )
        (else
          (call $func2 (f32.const 10.0))
        )
      )
    )
  )
  "type mismatch"
)