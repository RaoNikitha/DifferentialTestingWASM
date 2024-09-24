;; 9. Construct a test where a loop conditionally branches out using `br_if` based on a combined logical AND condition involving two stack operands. Check that the stack unwinding and condition evaluation correctly influence branch decisions.

(assert_invalid
  (module
    (func $complex-loop
      (param i32 i32)
      (result i32)
      (local i32)
      (local.set 2 (i32.const 0))
      (loop (result i32)
        (local.get 0)
        (local.get 1)
        (i32.and)
        (br_if 1)
        (local.get 2)
        (i32.const 1)
        (i32.add)
        (local.set 2)
        (br 0)
      )
    )
  )
  "type mismatch"
)