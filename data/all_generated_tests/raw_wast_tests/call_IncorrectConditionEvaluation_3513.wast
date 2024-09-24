;; 2. Execute a sequence where a nested function call happens inside a `br_if` condition. If the condition fails, pop an operand; if it passes, use the result of the nested call to push a value. This will check if nested conditions and stack operations are handled correctly.

(assert_invalid
  (module
    (func $nested_br_if_call
      (block
        (br_if 0
          (call $inner_function (i32.const 1) (i32.const 2))
        )
        (drop)
      )
    )
    (func $inner_function (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)