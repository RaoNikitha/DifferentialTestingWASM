;; Create a block that introduces local variables, includes a nested block structure, and uses `br` instructions to jump outside the nested block. This test evaluates whether the local variables remain intact and the operand stack is correctly managed during the branch resolution process.

(assert_invalid
  (module (func $test-block-nested-br (result i32)
    (local i32)
    (i32.const 42)
    (local.set 0)
    (block (result i32)
      (i32.const 2)
      (block (result i32)
        (i32.const 1)
        (br 1)
      )
      (local.get 0)
    )
  ))
  "type mismatch"
)