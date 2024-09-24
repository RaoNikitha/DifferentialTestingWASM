;; Develop a test where an `if` block specifies output of two values (`i32`, `f32`), but the `then` block only pushes one value that matches `[i32]`, and the `else` block pushes two values, `[i32, f32]`. This tests the implementations' enforcement of stack type consistency across control flow branches.

(assert_invalid
  (module (func $inconsistent-block (result i32 f32)
    (if (result i32 f32) (i32.const 1)
      (then (i32.const 1))
      (else (i32.const 1) (f32.const 1.0))
    )
  ))
  "type mismatch"
)