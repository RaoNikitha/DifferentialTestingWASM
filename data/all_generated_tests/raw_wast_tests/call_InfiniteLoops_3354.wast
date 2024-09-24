;; 3. Develop a function that calls another function in a loop, using a valid index just below an out-of-bounds index. Intentionally catch edge cases where incremental changes to the index may cause infinite loops if not properly checked by the `wizard_engine`.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $callee (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (type (func (param i32)))
    (func $caller
      (local i32)
      (i32.const 0)
      (local.set 0)
      (block $loop
        (loop $out
          (local.get 0)
          (call 0)
          (local.set 0)
          (local.get 0)
          (i32.const 10)
          (i32.lt_s)
          (br_if $out)
        )
      )
    )
  )
  "type mismatch"
)