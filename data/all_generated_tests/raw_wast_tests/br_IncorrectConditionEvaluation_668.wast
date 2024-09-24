;; 9. **Test Description**: Develop a test where nested loops have `br_if` conditions relying on counter variables. Check if `br_if` correctly evaluates the condition at the correct loop iteration.

(assert_invalid
  (module
    (func $loop-nested (param i32) (result i32)
      (block
        (loop
          (block
            (loop
              (br_if 1 (i32.eq (local.get 0) (i32.const 2)))
              (br_if 2 (i32.eq (local.get 0) (i32.const 4)))
            )
          )
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br 0)
        )
      )
      (local.get 0)
    )
  )
  "type mismatch"
)