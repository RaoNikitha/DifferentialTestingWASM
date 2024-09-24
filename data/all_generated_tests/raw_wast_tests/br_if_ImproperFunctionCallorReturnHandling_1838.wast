;; - A deeply nested block structure with multiple `br_if` instructions, each associated with calling different functions based on conditions and returning different values. Tests the robustness of stack management and control transfer handling in complex control flows.

(assert_invalid
  (module
    (func $deeply_nested_br_if (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (br_if 0 (i32.const 0)))
            (call $some_function)
            (br_if 1 (i32.const 1))
          )
          (call $another_function)
          (br_if 1 (i32.const 0))
        )
        (call $third_function)
        (br_if 1 (i32.const 1))
      )
      (i32.const 42)
    )
    (func $some_function (result i32) (i32.const 10))
    (func $another_function (result i32) (i32.const 20))
    (func $third_function (result i32) (i32.const 30))
  )
  "type mismatch"
)