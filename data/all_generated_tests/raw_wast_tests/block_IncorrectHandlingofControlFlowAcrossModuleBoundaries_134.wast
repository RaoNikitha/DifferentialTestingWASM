;; Design a complex `block` that wraps around multiple imported function calls, each of which manipulates the stack. Test to ensure that control flow correctly balances the stack after each call and behaves consistently with expected operand stack height.

(assert_invalid
  (module
    (import "env" "functionA" (func $functionA (param i32) (result i32)))
    (import "env" "functionB" (func $functionB (param i32) (result f32)))
    (func $complex-block-test
      (result f32)
      (block (result f32)
        (i32.const 42)
        (call $functionA)
        (block (result f32)
          (call $functionB)
          (br 1)
        )
        (i32.const 1)
        (i32.add)
      )
    )
  )
  "type mismatch"
)