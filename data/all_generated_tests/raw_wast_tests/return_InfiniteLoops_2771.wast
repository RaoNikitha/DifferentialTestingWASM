;; 10. Create a function containing a loop iterating over an array. Within the loop, set up a conditional `return` based on array element values. Validate if encountering specific values leads to an immediate exit from the loop using `return`.

(assert_invalid
  (module
    (func $loop-conditional-return (param i32) (result i32)
      (local i32)
      (local.set 0 (i32.const 0))
      (block $exit
        (loop $loop
          (local.get 0)
          (i32.load (local.get 0))
          (i32.const 0)
          (i32.eq)
          (if (then (return (local.get 0))))
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br $loop)
        )
      )
    )
  )
  "type mismatch"
)