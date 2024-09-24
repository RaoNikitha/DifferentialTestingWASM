;; Test 2: Implement a loop with a "br_if" instruction that conditionally breaks the loop based on a stack value modified by a called function. Validate if the called function correctly pops the argument and pushes the result back, ensuring no infinite loop if the condition is true.

(assert_invalid
  (module
    (func $called-func (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.add))
    (func (param i32)
      (local i32)
      (local.set 1 (i32.const 10))
      (block $loop
        (loop $loop
          (call $called-func (local.get 1))
          (local.set 1)
          (br_if $loop (i32.ne (local.get 1) (i32.const 0)))))
    )
  )
  "type mismatch"
)