;; 8. **Mixed Types in `loop` Instruction Sequence**: Write a sequence of instructions within a loop where the types output by these instructions are inconsistent with the loop's declared result type. This will ensure all instructions within the loop produce the expected types according to the loop's block type.

(assert_invalid
  (module (func $mixed-result-types
    (loop (param i32) (result i32)
      i32.const 1
      f32.const 0.0
      drop
    )
  ))
  "type mismatch"
)