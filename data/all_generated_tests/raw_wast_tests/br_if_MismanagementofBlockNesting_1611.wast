;; 2. **Test br_if in Nested Loops with Different Operand Types**:     Construct a series of nested loops where each loop has different entry and exit types. Employ `br_if` to conditionally exit the loops. This will check if the operand stacks are correctly managed when br_if instruction is executed, considering the loop's input and output types.

(assert_invalid
  (module
    (func $nested_loops
      (loop (result i32) (i32.const 1)  ;; Loop A
        (loop (result f32) (f32.const 2.0)  ;; Loop B
          (br_if 1 (i32.const 1))  ;; Conditional branch to exit from Loop A
        )
      )
    )
  )
  "type mismatch"
)