;; Test 8: Create a block with a `valtype` of `i32?` where the instructions within output a different valtype, such as `f32`. This checks if the block's short-hand notation for function type is strictly enforced against actual operations in the instructions.

(assert_invalid
  (module (func $type-check-valtype-i32-vs-f32 (result i32)
    (block (result i32) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)