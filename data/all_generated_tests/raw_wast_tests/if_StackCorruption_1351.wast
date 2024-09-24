;; 2. **Test 2**: Create an `if` block where the `then` branch pops multiple values based on nested `if` conditions and the `else` branch pushes values depending on another condition. Mismatch in block types should lead to stack corruption when the `then` branch expects more values than available.

(assert_invalid
  (module
    (func
      (param i32)
      (result i32)
      (if (result i32)
        (local.get 0)
        (then
          (if (result i32)
            (i32.const 1)
            (then (i32.const 2) (i32.add) (i32.const 1)) ; Expects multiple values, may mismatch
            (else (i32.const 1)) ; Pushes one value
          )
        )
        (else
          (if (result i32)
            (i32.const 0)
            (then (i32.const 3))
            (else (i32.const 4) (drop)) ; Pushes and drops value
          )
        )
      )
    )
  )
  "type mismatch"
)