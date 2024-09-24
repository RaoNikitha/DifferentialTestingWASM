;; 2. Implement a function that recursively calls itself with a base case returning a value. Verify proper recursion depth handling and correct return value at the base case in both implementations.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $recursive (type 0) (param i32) (result i32)
      (local.get 0)
      (i32.const 0)
      (i32.eq)
      (if (result i32)
        (then (i32.const 1))
        (else
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (call $recursive)
        )
      )
    )
    (func (result i32)
      (i32.const 10)
      (call $recursive)
    )
  )
  "type mismatch"
)