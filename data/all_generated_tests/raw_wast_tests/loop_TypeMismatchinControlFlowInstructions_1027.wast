;; 8. Include a `loop` with complex control flow that modifies stack types based on runtime conditions using `br_if`. Create a scenario where the actual branch types do not conform to the loop’s declared block type.

(assert_invalid
  (module (func $complex-control-flow
    (param i32) (result f32)
    (local i32)
    loop (result f32)
      local.get 0
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      local.get 1
      i32.eq
      br_if 0
      f32.const 0.0
    end
  ))
  "type mismatch"
)