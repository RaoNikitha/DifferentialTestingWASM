;; 3. Create a test loop that manipulates multiple types of values in the operand stack, such as integers and floating-point numbers, before performing a `br_table` indirect branch. Confirm the stack remains correctly ordered and types are preserved through indirect branching.

(assert_invalid
  (module
    (func $manipulate-multi-types (result f32)
      i32.const 10
      f32.const 5.5
      loop (result f32)
        i32.const 20
        f32.const 3.3
        br_table 0 0
      end
    )
  )
  "type mismatch"
)